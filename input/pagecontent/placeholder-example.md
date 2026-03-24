# AQL View - return all lab tests for a patient

This page shows the AQL query that will return a list of all lab test compositions saved against a patient (ehrId) and the response when sending that query via an AQL View.

## AQL query

Parameters `:ehrId`, `:dateFrom`, and `:dateTo` are strings that restrict results to one patient and a date range.

The block below uses the `sql` highlighter so keywords and parameters are easier to scan; syntax is **openEHR AQL**, not SQL.

```sql
SELECT DISTINCT
    o/data[at0001]/events[at0002]/data[at0003]/items[at0005]/value AS Laboratory_Test_Name,
    o/data[at0001]/events[at0002]/data[at0003]/items[at0073]/value AS status,
    c/context/start_time/value AS composition_context_start_time_value
FROM EHR e
CONTAINS COMPOSITION c[openEHR-EHR-COMPOSITION.report-result.v1]
CONTAINS OBSERVATION o[openEHR-EHR-OBSERVATION.laboratory_test_result.v1]
WHERE
    e/ehr_id/value = :ehrId
    AND composition_context_start_time_value >= :dateFrom
    AND composition_context_start_time_value <= :dateTo
ORDER BY composition_context_start_time_value DESC
OFFSET 0 LIMIT 200
```

## AQL response

```json
[
    {
        "Laboratory_Test_Name": {
            "@class": "DV_TEXT",
            "value": "Hepatic function panel"
        },
        "status": {
            "@class": "DV_CODED_TEXT",
            "value": "Final",
            "defining_code": {
                "@class": "CODE_PHRASE",
                "terminology_id": {
                    "@class": "TERMINOLOGY_ID",
                    "value": "local"
                },
                "code_string": "at0038"
            }
        },
        "composition_context_start_time_value": "2026-03-12T23:41:00.77633228+01:00"
    }
]
```
