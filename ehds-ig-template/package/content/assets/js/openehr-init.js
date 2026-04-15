function highlightAql() {
  var formatter = new AqlFormatter();
  document.querySelectorAll('code.language-aql').forEach(function(codeElement) {
    var block = codeElement.parentElement;
    if (block.tagName !== 'PRE') return;
    if (codeElement.hasAttribute('data-aql-processed')) return;
    var code = codeElement.textContent.trim();
    var formatted = formatter.formatAql(code);
    block.classList.add('cm-s-ehrexplorer');
    formatter.highlightAql(formatted, codeElement);
    codeElement.setAttribute('data-aql-processed', 'true');
  });
}

function initOpenEHRExamples() {
  var formatter = new AqlFormatter();
  document.querySelectorAll('.openehr-example-set').forEach(function(set) {
    if (set.hasAttribute('data-oe-init')) return;
    set.setAttribute('data-oe-init', 'true');

    set.querySelectorAll('.openehr-format-tabs .openehr-tab-link').forEach(function(link) {
      link.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        var href = link.getAttribute('href');
        if (!href || href === '#') return;
        var tabId = href.replace(/^#/, '');
        set.querySelectorAll('.openehr-format-tabs li').forEach(function(li) {
          li.classList.remove('active');
        });
        set.querySelectorAll('.openehr-tab-pane').forEach(function(pane) {
          pane.classList.remove('active');
        });
        link.parentElement.classList.add('active');
        var pane = document.getElementById(tabId);
        if (pane) pane.classList.add('active');
      });
    });

    set.querySelectorAll('.openehr-tab-pane code.language-json').forEach(function(codeEl) {
      if (codeEl.hasAttribute('data-json-processed')) return;
      var raw = codeEl.textContent.trim();
      var pretty;
      try {
        pretty = JSON.stringify(JSON.parse(raw), null, 2);
      } catch (e) {
        pretty = raw;
      }
      formatter.highlightJson(pretty, codeEl);
      codeEl.setAttribute('data-json-processed', 'true');
    });
  });
}

window.addEventListener('load', function() {
  highlightAql();
  initOpenEHRExamples();
});
