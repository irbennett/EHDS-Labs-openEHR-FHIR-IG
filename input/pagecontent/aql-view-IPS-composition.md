# AQL View IPS Composition

This page shows the AQL query that returns a persisted IPS composition - the response returns the whole composition in CANONICAL format.

## AQL query


The block below uses the `sql` highlighter so keywords and parameters are easier to scan; syntax is **openEHR AQL**, not SQL.

```sql
SELECT c as Composition,
    c/context/start_time/value as start_time  
    FROM EHR e[ehr_id/value = '{{ehrId}}']
    CONTAINS VERSION v
    CONTAINS COMPOSITION c
    WHERE c/archetype_details/template_id/value = '{{templateId}}'
  ORDER BY c/context/start_time/value DESC
  LIMIT 1  
```

## Partial AQL response

```json
{ ...
   "rows": [
       [
   
            {
                "_type": "COMPOSITION",
                "archetype_node_id": "openEHR-EHR-COMPOSITION.health_summary.v1",
                "name": {
                    "_type": "DV_TEXT",
                    "value": "International Patient Summary"
                },
                "uid": {
                    "_type": "OBJECT_VERSION_ID",
                    "value": "dd784954-dc68-4790-ae7f-67b9b97172b0::com.freshehr.ehrbase::1"
                },
                "archetype_details": {
                    "archetype_id": {
                        "value": "openEHR-EHR-COMPOSITION.health_summary.v1"
                    },
                    "rm_version": "1.1.0",
                    "template_id": {
                        "value": "International Patient Summary"
                    }
                },...

```
