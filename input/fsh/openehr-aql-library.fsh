// ╭─────────────────────────────────────────────────────────────────╮
// │  openEHR AQL Library — CodeSystem, Profile, and Instances       │
// ╰─────────────────────────────────────────────────────────────────╯

// ---------------------------------------------------------------------------
// CodeSystem: openEHR library types
// ---------------------------------------------------------------------------

CodeSystem: OpenEHRLibraryType
Id: openehr-library-type
Title: "openEHR Library Type"
Description: "Codes for the type of knowledge artifact content stored in a Library resource in the context of openEHR interoperability."
* ^status = #active
* ^caseSensitive = true
* ^content = #complete
* #aql "Archetype Query Language" "An openEHR AQL query expression."

// ---------------------------------------------------------------------------
// Profile: AQLLibrary
// ---------------------------------------------------------------------------

Profile: AQLLibrary
Parent: Library
Id: openehr-aql-library
Title: "openEHR AQL Library"
Description: "Profile of the FHIR Library resource for carrying an openEHR Archetype Query Language (AQL) query, its parameters, and associated metadata."

* type = OpenEHRLibraryType#aql "Archetype Query Language"
* type MS

// The AQL query text is carried as a single attachment with content type text/x-aql
* content MS
* content ^slicing.discriminator.type = #value
* content ^slicing.discriminator.path = "contentType"
* content ^slicing.rules = #open
* content contains aqlQuery 1..1 MS
* content[aqlQuery].contentType 1..1 MS
* content[aqlQuery].contentType = #text/x-aql
* content[aqlQuery].data 1..1 MS

// Parameters map to AQL bound parameters (e.g. :compositionIdLab)
* parameter MS

// relatedArtifact can link to the associated openEHR template
* relatedArtifact MS

// ---------------------------------------------------------------------------
// Instance: Lab Results by Composition
// ---------------------------------------------------------------------------

Instance: AQLLabResultsByComposition
InstanceOf: AQLLibrary
Title: "AQL: Lab Results by Composition"
Description: "Returns analyte-level results for a single laboratory report composition identified by its UID."
Usage: #example

* id = "aql-lab-results-by-composition"
* url = "http://openehr.org/ig/ehds-test/Library/aql-lab-results-by-composition"
* version = "0.1.0"
* name = "AQLLabResultsByComposition"
* title = "Lab Results by Composition"
* status = #draft
* description = "Returns analyte-level results for a single laboratory report composition identified by its UID."
* type = OpenEHRLibraryType#aql

* parameter[0].name = #compositionIdLab
* parameter[0].use = #in
* parameter[0].min = 1
* parameter[0].max = "1"
* parameter[0].type = #string
* parameter[0].documentation = "UID of the laboratory report composition to query."

* relatedArtifact[0].type = #depends-on
* relatedArtifact[0].label = "openEHR template"
* relatedArtifact[0].display = "EHDS - Laboratory report"

// AQL content is base64-encoded. Value below encodes the query in aql-view-lab-results.aql.
* content[aqlQuery].contentType = #text/x-aql
* content[aqlQuery].data = "U0VMRUNUCiAgICB1L2l0ZW1zW2F0MDAwMV0vdmFsdWUvbWFnbml0dWRlIEFTIGFuYWx5dGVfcmVzdWx0LAogICAgdS9pdGVtc1thdDAwMDFdL3ZhbHVlL3VuaXRzIEFTIGFuYWx5dGVfcmVzdWx0X3VuaXRzLAogICAgdS9pdGVtc1thdDAwMDRdL3ZhbHVlIEFTIHJlZl9yYW5nZSwKICAgIHUvaXRlbXNbYXQwMDI0XS92YWx1ZS92YWx1ZSBBUyBhbmFseXRlX25hbWUsCiAgICB1L2l0ZW1zW2F0MDAwM10vdmFsdWUgQVMgQ29tbWVudCwKICAgIG8vZGF0YVthdDAwMDFdL2V2ZW50c1thdDAwMDJdL2RhdGFbYXQwMDAzXS9pdGVtc1thdDAwMDVdL3ZhbHVlIEFTIExhYm9yYXRvcnlfVGVzdF9OYW1lCkZST00gRUhSIGUKQ09OVEFJTlMgQ09NUE9TSVRJT04gY1tvcGVuRUhSLUVIUi1DT01QT1NJVElPTi5yZXBvcnQtcmVzdWx0LnYxXQpDT05UQUlOUyBPQlNFUlZBVElPTiBvW29wZW5FSFItRUhSLU9CU0VSVkFUSU9OLmxhYm9yYXRvcnlfdGVzdF9yZXN1bHQudjFdCkNPTlRBSU5TIENMVVNURVIgdVtvcGVuRUhSLUVIUi1DTFVTVEVSLmxhYm9yYXRvcnlfdGVzdF9hbmFseXRlLnYxXQpXSEVSRQogICAgYy91aWQvdmFsdWUgPSA6Y29tcG9zaXRpb25JZExhYgogICAgQU5EIEVYSVNUUyBhbmFseXRlX3Jlc3VsdA=="
