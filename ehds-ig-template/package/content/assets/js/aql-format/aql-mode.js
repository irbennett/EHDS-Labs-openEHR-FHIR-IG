/*
Copyright (c) 2014 Marand (marand.com)
Author: Marko Pipan
Licensed under the GPLv3 license:
http://www.gnu.org/licenses/gpl.html
*/

AqlContext = {
    global: "global",
    aqlRoot: "aqlRoot",

    select: "select",
    from: "from",
    where: "where",
    order: "order"
};


AqlContextKeywords = {

};

AqlContextTransitions = {

};


AqlModeData = {
    keywords: {},
    archTypes: {
        COMPOSITION: true,
        ACTION: true,
        CLUSTER: true,
        OBSERVATION: true,
        EVALUATION: true,
        INSTRUCTION: true,
        SECTION: true
    },
    specialTypes: {
        PATIENT_EHR: true,
        VERSION: true,
        VERSIONED_OBJECT: true
    },
    // Aggregate/scalar functions — rendered with "builtin" style
    functions: {
        COUNT: true, MIN: true, MAX: true, AVG: true, SUM: true
    },
    // Logical/predicate keywords — rendered with "atom" style (muted vs clause keywords)
    logicalKeywords: {
        AND: true, OR: true, XOR: true, NOT: true,
        EXISTS: true, MATCHES: true
    }

};


CodeMirror.defineMode("aql", function (config, parserConfig) {
    var indentUnit = config.indentUnit, keywords = parserConfig.keywords, functions = parserConfig.functions, types = parserConfig.types, sqlplus = parserConfig.sqlplus, multiLineStrings = parserConfig.multiLineStrings;
    var isOperatorChar = /[+\-*&%=<>!?:\/|]/;

    function chain(stream, state, f) {
        state.tokenize = f;
        return f(stream, state);
    }

    var type;

    function processToken(stream, state, tp, style) {
        var token = {
            string: stream.current(),
            className: tp
        };

        var transition = AqlContextTransitions[AqlContext.global];
        var trResp = transition(stream, token, state);
        if (trResp != undefined)
            return style;

        transition = AqlContextTransitions[state.context.id];
        if (transition) {
            transition(stream, token, state);
        }
        if (token.className != null) {
            state.global.lastTokens.unshift(token);
            if (state.global.lastTokens.length > 3) {
                state.global.lastTokens.pop();
            }
        }

        type = tp;
        return style;
    }


    function tokenBase(stream, state) {
        function retContext(tp, style) {
            return processToken(stream, state, tp, style);
        }


        var ch = stream.next();


        // space
        if (/\s/.test(ch)) {
            stream.eatWhile(/\s/);
            return retContext(null, null)

        } // start of string?
        if (ch == '"' || ch == "'") {
            return chain(stream, state, tokenString(ch));
        } // is it aql-brackets start
        else if (ch == '[') {
            stream.eatWhile(/[^\]]/);
            // Distinguish openEHR archetype IDs from node IDs / path predicates
            var bracketContent = stream.current().substring(1); // strip leading '['
            stream.eat("]");
            if (/openEHR/i.test(bracketContent)) {
                return retContext("archetype-id", "archetype-id");
            }
            return retContext("aql-brackets", "aql-brackets");
        } // is it one of the special signs []{}().,;? Separator?
        else if (/[\[\]{}\(\),;\.]/.test(ch)) {
            return retContext("symbol", "symbol");
        } // start of a number value?
        else if (/\d/.test(ch)) {
            stream.eatWhile(/[\w\.]/);
            return retContext("number", "number");
        } // multi line comment or simple operator?
        else if (ch == "/") {
            if (stream.eat("*")) {
                return chain(stream, state, tokenComment);
            }
            else {
                stream.eatWhile(isOperatorChar);
                return retContext("operator", "operator");
            }
        }
        // single line comment or simple operator?
        else if (ch == "-") {
            if (stream.eat("-")) {
                stream.skipToEnd();
                return retContext("comment", "comment");
            }
            else {
                stream.eatWhile(isOperatorChar);
                return retContext("operator", "operator");
            }
        }
        // pl/sql variable?
        else if (ch == "@" || ch == "$") {
            stream.eatWhile(/[\w\d\$_]/);
            return retContext("word", "variable");
        }
        // named query parameter like :ehrId
        else if (ch == ":" && /\w/.test(stream.peek())) {
            stream.eatWhile(/[\w\d_]/);
            return retContext("parameter", "parameter");
        }
        // is it a operator?
        else if (isOperatorChar.test(ch)) {
            stream.eatWhile(isOperatorChar);
            return retContext("operator", "operator");
        }
        // is it an aql macro property?
        else if (ch == "#") {
            return parseMacro(stream, state);
        }
        else {
            // get the whole word
            stream.eatWhile(/[\w\$_]/);
            // an aql macro may also be after a word
            if (stream.peek() == "#") {
                stream.next();
                return parseMacro(stream, state);
            }

            var token = stream.current().toUpperCase();

            if (AqlModeData.archTypes[token]) {
                state.context.archType = token;
            }
            // aggregate/scalar functions → builtin style (distinct from clause keywords)
            if (AqlModeData.functions[token]) return retContext("function-keyword", "builtin");
            // logical/predicate keywords → atom style (muted, not bold-purple like clause keywords)
            if (AqlModeData.logicalKeywords[token]) return retContext("logical-keyword", "atom");
            // 'as' alias marker → quiet qualifier style
            if (token === "AS") return retContext("as-keyword", "qualifier");
            // is it one of the listed keywords?
            if (keywords && keywords.propertyIsEnumerable(token)) return retContext("keyword", "keyword");
            // default: just a "word"
            return retContext("word", "word");
        }
    }

    function parseMacro(stream, state) {
        if (stream.peek() === '[') {
            stream.eatWhile(/[^\s\]]/);
            if (stream.peek() === ']') stream.eat(']');

        } else {
            stream.eatWhile(/[^-+\s=<>,\(\)\{\}]/);
        }
        return processToken(stream, state, "macro", "macro");
    }

    function tokenString(quote) {
        return function (stream, state) {
            var escaped = false, next, end = false;
            while ((next = stream.next()) != null) {
                if (next == quote && !escaped) {
                    end = true;
                    break;
                }
                escaped = !escaped && next == "\\";
            }
            if (end || !(escaped || multiLineStrings))
                state.tokenize = tokenBase;
            return processToken(stream, state, "string", "string");
        };
    }

    function tokenComment(stream, state) {
        var maybeEnd = false, ch;
        while (ch = stream.next()) {
            if (ch == "/" && maybeEnd) {
                state.tokenize = tokenBase;
                break;
            }
            maybeEnd = (ch == "*");
        }
        return processToken(stream, state, "comment", "comment");
    }

    // Interface

    return {
        startState: function (basecolumn) {
            return {
                tokenize: tokenBase,
                startOfLine: true,
                error: null,
                global: { vars: {}, lastTokens: [] },
                context: {
                    id: AqlContext.aqlRoot,
                    archType: null
                }
            };
        },

        token: function (stream, state) {
            //if (stream.eatSpace()) return null;
            var style = state.tokenize(stream, state);
            return style;
        }
    };
});


(function () {
    function keywords(str) {
        var obj = {}, words = str.toUpperCase().split(" ");
        for (var i = 0; i < words.length; ++i) obj[words[i]] = true;
        return obj;
    }


    function extractMacroFromString(string) {
        var hashPos = string.indexOf('#');
        if (hashPos < 0) {
            return {
                varName: string
            }
        } else {
            return {
                varName: string.substring(0, hashPos),
                path: string.substring(hashPos + 1)
            }
        }
    }

    function defineAqlContextTransitions() {
        function setContext(state, contextId, copyOld) {
            //console.log("Context change: " + state.context.id + " --> " + contextId);
            if (copyOld) {
                state.context.id = contextId;
            }
            else {
                state.context = {id: contextId};
            }
            return state.context;
        }


        AqlContextTransitions[AqlContext.global] = function (stream, token, state) {
            if (token.className === 'keyword') {
                var context;
                switch (token.string.toLowerCase()) {
                    case 'select':
                        return setContext(state, AqlContext.select);
                    case 'from':
                        return setContext(state, AqlContext.from);
                    case 'where':
                        return setContext(state, AqlContext.where);
                    case 'order':
                        return setContext(state, AqlContext.order);
                }
            }
            return undefined;
        };


        AqlContextTransitions[AqlContext.from] = function (stream, token, state) {
            if (token.className === "keyword") {
                state.context.type = token.string.toLowerCase();
            } else if (token.className === "word") {
                if (state.context.type != null) {
                    var typeUpper = state.context.type.toUpperCase();
                    if (state.context.type == "ehr") {
                        state.global.vars[token.string] = {
                            name: null,
                            type: "PATIENT_EHR"
                        }
                    } else if (AqlModeData.archTypes[typeUpper] || AqlModeData.specialTypes[typeUpper]) {
                        // todo special parse for a[archetypeId]
                        var variable = {
                            name: null,
                            type: typeUpper
                        };
                        state.global.vars[token.string] = variable;
                        if (typeUpper === "COMPOSITION") {
                            state.global.lastTemplate = variable;
                        } else {
                            variable.containingTemplate = state.global.lastTemplate;
                        }
                    }
                } else {
                    state.context.type = token.string.toLowerCase();
                }
            } else if (token.className === 'macro') {
                var hashPos = token.string.indexOf('#');
                if (hashPos > 0) {
                    var identifier = token.string.substring(0, hashPos);
                    var archetypeName = token.string.substring(hashPos + 1);
                     var variable = {
                        name: archetypeName,
                        type: state.context.archType
                    }
                    state.global.vars[identifier] = variable;
                    if (variable.type === "COMPOSITION") {
                        state.global.lastTemplate = variable;
                    } else {
                        variable.containingTemplate = state.global.lastTemplate;
                    }
                }
            }
        };

        AqlContextTransitions[AqlContext.select] = function (stream, token, state) {
            if (token.className === "word") {
                if (state.global.lastTokens.length >= 2
                  && state.global.lastTokens[0].string.toLowerCase() === "as")
                {

                    var pathToken = state.global.lastTokens[1];
                    if (pathToken.className === "macro") {
                        var macro = extractMacroFromString(pathToken.string);

                        state.global.vars[token.string] = {
                            name: macro.varName,
                            path: macro.path,
                            type: "alias"
                        }
                    }
                }
            }
        }
    }


    defineAqlContextTransitions();


    AqlContextKeywords[AqlContext.aqlRoot] = keywords("select");
    AqlContextKeywords[AqlContext.select] = keywords("as from count min max avg sum distinct");
    AqlContextKeywords[AqlContext.from] = keywords("contains ehr composition observation evaluation instruction action where order offset limit fetch version versioned_object cluster top");
    AqlContextKeywords[AqlContext.where] = keywords("and or xor not exists matches order offset limit fetch");
    AqlContextKeywords[AqlContext.order] = keywords("by asc desc ascending descending offset limit fetch");


    AqlModeData.keywords = {};
    for (var i in AqlContextKeywords) {
        var kws = AqlContextKeywords[i];
        for (var j in kws) {
            AqlModeData.keywords[j] = kws[j];
        }
    }

    CodeMirror.defineMIME("text/aql", {
        name: "aql",
        keywords: AqlModeData.keywords
    });

}

  ()
  )
;

/* ── JSON syntax mode ──────────────────────────────────────────────────────
   Provides syntax highlighting for openEHR composition examples displayed
   in the tabbed viewer.  Token types map to the existing cm-s-ehrexplorer
   colour palette:
     property → blue   (object keys)
     string   → green  (string values)
     number   → dark-green
     atom     → dark-blue  (true / false / null)
     bracket  → gold   ({ } [ ])
     operator → black  (: ,)
   ─────────────────────────────────────────────────────────────────────── */
CodeMirror.defineMode("json-ehr", function () {
    return {
        startState: function () {
            // stack entries: 'k' = expecting object key, 'v' = expecting value, '[' = inside array
            return { stack: [], inStr: false, strType: "string", escape: false };
        },
        token: function (stream, state) {
            /* ---- inside a string ---- */
            if (state.inStr) {
                if (state.escape) { state.escape = false; stream.next(); return state.strType; }
                var c = stream.next();
                if (c === "\\") { state.escape = true; return state.strType; }
                if (c === '"')  { state.inStr = false;  return state.strType; }
                stream.eatWhile(/[^"\\]/);
                return state.strType;
            }

            if (stream.eatSpace()) return null;

            var ch = stream.next();

            /* ---- open string ---- */
            if (ch === '"') {
                state.inStr  = true;
                state.escape = false;
                var top = state.stack[state.stack.length - 1];
                state.strType = (top === 'k') ? "property" : "string";
                return state.strType;
            }

            /* ---- structural characters ---- */
            if (ch === '{') { state.stack.push('k'); return "bracket"; }
            if (ch === '[') { state.stack.push('['); return "bracket"; }
            if (ch === '}' || ch === ']') { state.stack.pop(); return "bracket"; }
            if (ch === ':') {
                if (state.stack.length && state.stack[state.stack.length - 1] === 'k') {
                    state.stack[state.stack.length - 1] = 'v';
                }
                return "operator";
            }
            if (ch === ',') {
                if (state.stack.length && state.stack[state.stack.length - 1] === 'v') {
                    state.stack[state.stack.length - 1] = 'k';
                }
                return "operator";
            }

            /* ---- number ---- */
            if (ch === '-' || /\d/.test(ch)) {
                stream.match(/[\d.eE+\-]*/);
                return "number";
            }

            /* ---- keywords: true / false / null ---- */
            stream.backUp(1);
            if (stream.match("true") || stream.match("false") || stream.match("null")) {
                return "atom";
            }

            stream.next();
            return "error";
        }
    };
});
CodeMirror.defineMIME("application/json", "json-ehr");
