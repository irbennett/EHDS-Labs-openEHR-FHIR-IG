# AQL Queries

openEHR Archetype Query Language (AQL) queries for retrieving clinical data from an openEHR Clinical Data Repository (CDR).

AQL uses a SQL-like syntax with openEHR-specific path expressions and archetype identifiers.
Query parameters are passed at runtime — parameters prefixed with `:` use named binding
(e.g. `:ehrId`), while `{{parameter}}` notation denotes template placeholders to be substituted
before sending.

{% include openehr-aql-table.html %}
