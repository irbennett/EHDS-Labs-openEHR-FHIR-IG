# AQL View lab results

This page shows the AQL query that returns **analyte-level** results for a single laboratory report composition, and an example response from an AQL View.

## AQL query

Parameter `:compositionIdLab` identifies the lab report composition (by composition UID).

The block below uses the `sql` highlighter so keywords and parameters are easier to scan; syntax is **openEHR AQL**, not SQL.

```sql
SELECT
    u/items[at0001]/value/magnitude AS analyte_result,
    u/items[at0001]/value/units AS analyte_result_units,
    u/items[at0004]/value AS ref_range,
    u/items[at0024]/value/value AS analyte_name,
    u/items[at0003]/value AS Comment,
    o/data[at0001]/events[at0002]/data[at0003]/items[at0005]/value AS Laboratory_Test_Name
FROM EHR e
CONTAINS COMPOSITION c[openEHR-EHR-COMPOSITION.report-result.v1]
CONTAINS OBSERVATION o[openEHR-EHR-OBSERVATION.laboratory_test_result.v1]
CONTAINS CLUSTER u[openEHR-EHR-CLUSTER.laboratory_test_analyte.v1]
WHERE
    c/uid/value = :compositionIdLab
    AND EXISTS analyte_result
```

## AQL response

```json
[
    {
        "analyte_result": 6,
        "analyte_result_units": "umol/L",
        "ref_range": {
            "@class": "DV_TEXT",
            "value": "< 21"
        },
        "analyte_name": "Total bilirubin substance concentration in serum",
        "Comment": null,
        "Laboratory_Test_Name": {
            "@class": "DV_TEXT",
            "value": "Hepatic function panel"
        }
    },
    {
        "analyte_result": 145,
        "analyte_result_units": "iu/L",
        "ref_range": {
            "@class": "DV_TEXT",
            "value": "30 - 130"
        },
        "analyte_name": "Alkaline phosphatase liver isoenzyme enzyme activity in serum",
        "Comment": {
            "@class": "DV_TEXT",
            "value": "High"
        },
        "Laboratory_Test_Name": {
            "@class": "DV_TEXT",
            "value": "Hepatic function panel"
        }
    }
]
```
