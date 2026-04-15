# AQL View lab results

This page shows the AQL query that returns **analyte-level** results for a single laboratory report composition, and an example response from an AQL View.

## AQL query

Parameter `:compositionIdLab` identifies the lab report composition (by composition UID).

The block below uses the `aql` highlighter; syntax is **openEHR AQL**.

{% include oeAql.html id="lab-results-composition" %}

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
