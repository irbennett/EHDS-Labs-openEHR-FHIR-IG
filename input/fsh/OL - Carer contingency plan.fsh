Logical: OLCarerContingencyPlan
Title: "OL - Carer contingency plan"
Parent: Element
Description: """[openEHR-EHR-COMPOSITION.anticipatory_care_information.v0] A framework to communicate information that has been captured and curated in anticipation of future need for care."""
* ^name = "OLCarerContingencyPlan"
* ^status = #active
* ^version = "0.6.0"
* ^url = "http://openehr.org/StructureDefinition/OLCarerContingencyPlan"
* codedText 1..1 DvCodedText "coded_text" """[at0001] """
* codedText from OLCarerContingencyPlanCodedText (required)
* composer 1..1 PARTY_PROXY "composer" """[RM] The person primarily responsible for the content of the Composition (but not necessarily its committal into the EHR system). This is the identifier which should appear on the screen. It may or may not be the person who entered the data. When it is the patient, the special self instance of `PARTY_SELF` will be used."""
* context 1..1 EVENT_CONTEXT "Context" """[at0002] `COMPOSITION.context` - Documents the context information of a healthcare event involving the subject of care and the health system. The context information recorded here are independent of the attributes recorded in the version audit, which document the system interaction context, i.e. the context of a user interacting with the health record system. Healthcare events include patient contacts, and any other business activity, such as pathology investigations which take place on behalf of the patient."""
  * startTime 1..1 DvDateTime "start_time" """[RM] COMPOSITION.context.start_time - Start time of the clinical session or other kind of event during which a provider performs a service of any kind for the patient."""
  * setting 1..1 DvCodedText "setting" """[RM] The setting in which the clinical session took place. Coded using the openEHR Terminology, setting group."""
  * setting from OLCarerContingencyPlanSetting (required)
  * xDSMetadata 0..1 Cluster "XDS Metadata" """[openEHR-EHR-CLUSTER.xds_metadata.v0] Additional composition metadata aligned with IHE-XDS which is not already available from the Reference Model COMPOSITION class."""
    * authorSpecialty 0..1 DV_TEXT "Author specialty" """[at0001] The speciality of the author/composer of the document."""
    * classCode 0..1 DV_TEXT "Class code" """[at0002] A high-level document class code, normally selected from a valueset provided by the IHE-XDS Affinity Domain."""
    * documentType 0..1 DV_TEXT "Document type" """[at0003] The code specifying the precise type of document from the user perspective. Normally selected from a valueset provided by the local IHE-XDS Affinity Domain or national standard."""
    * confidentialityCode 0..1 DV_TEXT "Confidentiality code" """[at0004] A term specifying the level of confidentiality of the XDS Document."""
    * healthCareFacilityType 0..1 DV_TEXT "Health care facility type" """[at0007] A term defining the healthcare facility type."""
    * practiceSettingCode 0..1 DV_TEXT "Practice setting code" """[at0009] The code specifying the clinical specialty where the act that resulted in the document was performed."""
    * eventCode 0..* DV_TEXT "Event code" """[at0011] This list of codes represents the main clinical acts."""
    * documentMedia 0..1 DvMultimedia "Document_media" """[at0010] Additional metadata about the document itself, including size, url."""
  * careJourneyMetadata 0..1 Cluster "Care journey metadata" """[openEHR-EHR-CLUSTER.care_journey_metadata.v0] Tp capture Care plan metadata"""
    * carePlanName 0..1 DV_TEXT "Care plan name" """[at0001] The name , preferably coded of the Care plan with which this journey is associated, and against which the composition was updated."""
    * carePlanIdentifier[x] 0..1 DV_TEXT or DvIdentifier "Care plan identifier" "at0002: The identifier , preferably coded, of the Care plan with which this journey is associated, and against which the composition was updated."
    * patientJourneyIdentifier[x] 0..1 DV_TEXT or DvIdentifier "Patient journey identifier" "at0003: A patient-journey specific identifier i.e unique to a patient's journey along a specific care pathway."
* PersonalResponsibilities 0..1 EVALUATION "Personal responsibilities" """[openEHR-EHR-EVALUATION.personal_responsibilities.v1] Personal responsibilities"""
  * responsibilitiesStatus 0..1 DvCodedText "Responsibilities status" """[at0036] """
  * responsibilitiesStatus from OLCarerContingencyPlanResponsibilitiesStatus (required)
  * description 0..1 DV_TEXT "Description" """[at0043] """
  * primaryCarerParentalResponsibility 0..1 Cluster "Primary carer /parental responsibility" """[at0005] """
    * careContingencyPlanStatus 0..1 DvCodedText "Care contingency plan status" """[at0035] """
    * careContingencyPlanStatus from OLCarerContingencyPlanCareContingencyPlanStatus (required)
    * caredForPerson 0..1 DV_TEXT "Cared for person" """[at0010] """
    * howLongCanTheyWaitOnTheirOwn 0..1 DV_TEXT "How long can they wait on their own" """[at0011] """
    * replacementCarer 0..1 Cluster "Replacement carer" """[at0013] """
      * member 0..1 Cluster "Member" """[openEHR-EHR-CLUSTER.contact_cc.v0] Contacts for patients and organisations (excluding practitioners)."""
        * relationship 0..* DvCodedText "Relationship" """[at0001] The relationship between the subject and the contact. This field is only appropriate when the archetype is used for patient contacts, not for organisation contacts."""
        * relationship from OLCarerContingencyPlanRelationship (preferred)
        * primaryContact 0..* DvCodedText "Primary contact" """[at0001] The relationship between the subject and the contact. This field is only appropriate when the archetype is used for patient contacts, not for organisation contacts."""
        * primaryContact from OLCarerContingencyPlanPrimaryContact (required)
        * supportContactType 0..* DvCodedText "Support contact type" """[at0001] The relationship between the subject and the contact. This field is only appropriate when the archetype is used for patient contacts, not for organisation contacts."""
        * supportContactType from OLCarerContingencyPlanSupportContactType (required)
        * additionalInformation 0..1 DV_TEXT "Additional information" """[at0013] Indicates a purpose for which the contact can be reached. This field is only appropriate when the archetype is used inside an organisation cluster."""
        * membername 0..* Cluster "Name" """[openEHR-EHR-CLUSTER.name_cc.v0] Name details aligned with FHIR resource."""
          * use 1..1 DvCodedText "Use" """[at0001] Identification of the purpose for the name."""
          * use from OLCarerContingencyPlanUse (required)
          * contactName 0..1 DV_TEXT "Contact name" """[at0009] A text representation of the full name."""
        * telecomContact 0..* Cluster "Telecom contact" """[openEHR-EHR-CLUSTER.telecom_cc.v0] FHIR telecom details."""
          * contactType 0..1 DvCodedText "Contact type" """[at0001] Telecommunications form for contact point - what communications system is required to make use of the contact."""
          * contactType from OLCarerContingencyPlanContactType (required)
          * contactValue 0..1 DV_TEXT "Contact value" """[at0002] The actual contact point details, in a form that is meaningful to the designated communication system (i.e. phone number or email address)."""
        * address 0..* Cluster "Address" """[openEHR-EHR-CLUSTER.address_cc.v0] Address details aligned with FHIR resource."""
          * addressUse 0..1 DvCodedText "Address Use" """[at0001] The purpose of the address."""
          * addressUse from OLCarerContingencyPlanAddressUse (required)
          * street 0..1 DV_TEXT "Street" """[at0011] This component contains the house number, apartment number, street name, street direction, P.O. Box number, delivery hints, and similar address information."""
          * street2 0..1 DV_TEXT "Street2" """[at0011] This component contains the house number, apartment number, street name, street direction, P.O. Box number, delivery hints, and similar address information."""
          * city 0..1 DV_TEXT "City" """[at0012] The name of the city, town, village or other community or delivery center."""
          * county 0..1 DV_TEXT "County" """[at0013] The name of the administrative area (county)."""
          * postalCode 0..1 DV_TEXT "Postal code" """[at0014] A postal code designating a region defined by the postal service."""
          * country 0..1 DV_TEXT "Country" """[at0015] Country - a nation as commonly understood or generally accepted."""
        * dateAdded 0..1 DvDateTime "Date added" """[at0011] Date and time when contact detail starts to be valid."""
      * hasThePersonConsentedToTheReplacement 0..1 DvCodedText "Has the person consented to the replacement" """[at0012] """
      * hasThePersonConsentedToTheReplacement from OLCarerContingencyPlanHasThePersonConsentedToTheReplacement (required)
      * replacementHasConsentedToBeingContacted 0..1 DvCodedText "Replacement has consented to being contacted" """[at0016] """
      * replacementHasConsentedToBeingContacted from OLCarerContingencyPlanReplacementHasConsentedToBeingContacted (required)
      * replacementHasConsentedToActingInThatRole 0..1 DvCodedText "Replacement has consented to acting in that role" """[at0017] """
      * replacementHasConsentedToActingInThatRole from OLCarerContingencyPlanReplacementHasConsentedToActingInThatRole (required)
      * replacementHasACopyOfContingencyPlan 0..1 DvCodedText "Replacement has a copy of contingency plan" """[at0026] """
      * replacementHasACopyOfContingencyPlan from OLCarerContingencyPlanReplacementHasACopyOfContingencyPlan (required)
  * pet 0..* Cluster "Pet" """[at0040] """
    * petDetails 0..1 DV_TEXT "Pet details" """[at0041] """
  * dateLastUpdated 0..1 DvDateTime "Date last updated" """[at0004] """

ValueSet: OLCarerContingencyPlanCodedText
Title: "OL - Carer contingency plan: coded_text"
* http://openehr.org/archetypes/openEHR-EHR-COMPOSITION.anticipatory_care_information.v0/CS#433 "event"


ValueSet: OLCarerContingencyPlanSetting
Title: "OL - Carer contingency plan: setting"


ValueSet: OLCarerContingencyPlanResponsibilitiesStatus
Title: "OL - Carer contingency plan: Responsibilities status"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0037 "No critical responsibilities"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0038 "Has primary carer/parental responsibilities"


ValueSet: OLCarerContingencyPlanCareContingencyPlanStatus
Title: "OL - Carer contingency plan: Care contingency plan status"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#136632100000010 "Has Carer Contingency Plan / Has Carer Emergency Plan"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#199361000000101 "Is no longer a carer"


ValueSet: OLCarerContingencyPlanRelationship
Title: "OL - Carer contingency plan: Relationship"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#NOK "Next of Kin"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#AUNT "Aunt"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#BRO "Brother"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#BIL "Brother-in-Law"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#COHABIT "Cohabitee"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#COUSIN "Cousin"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#DAU "Daughter"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#DIL "Daughter-in-Law"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#FIL "Father-in-Law"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#FOSTER "Foster Carer"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#FRIEND "Friend"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#GCHILD "Grandchild"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#GPARENT "Grandparent"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#HALFBRO "Half Brother"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#HALFSIS "Half Sister"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#HUSBAND "Husband"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#MIL "Mother-in-Law"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#NEPHEW "Nephew"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#NIECE "Niece"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#PARENT "Parent"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#PARTNER "Partner"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#SIS "Sister"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#SIL "Sister-in-Law"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#SON "Son"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#SOIL "Son-in-Law"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#STEPBRO "Step Brother"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#STEPCHILD "Step Child"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#STEPPARENT "Step Parent"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#STEPSIS "Step Sister"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#UNCLE "Uncle"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#WIFE "Wife"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#OTHER "Other"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#PARENTALRESP "Has Parental Responsibility"


ValueSet: OLCarerContingencyPlanPrimaryContact
Title: "OL - Carer contingency plan: Primary contact"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#PRIMARYPERSONALCONTACT "Primary personal contact"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#NOK "Next of Kin"


ValueSet: OLCarerContingencyPlanSupportContactType
Title: "OL - Carer contingency plan: Support contact type"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#PERSONAL "Personal"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#POA "Health and Welfare Power of Attorney"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#PARENTALRESP "Has Parental Responsibility"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.contact_cc.v0/CS#DEPHW "Health and Welfare Deputy"


ValueSet: OLCarerContingencyPlanUse
Title: "OL - Carer contingency plan: Use"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.name_cc.v0/CS#at0002 "Usual"


ValueSet: OLCarerContingencyPlanContactType
Title: "OL - Carer contingency plan: Contact type"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.telecom_cc.v0/CS#EMAIL "EMail"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.telecom_cc.v0/CS#FAX "Fax"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.telecom_cc.v0/CS#HOME "Home Phone"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.telecom_cc.v0/CS#MOBILE "Mobile Phone"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.telecom_cc.v0/CS#OFFICE "Office Phone"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.telecom_cc.v0/CS#OTHER "Other Phone"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.telecom_cc.v0/CS#WORK "Work Phone"


ValueSet: OLCarerContingencyPlanAddressUse
Title: "OL - Carer contingency plan: Address Use"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.address_cc.v0/CS#BILLING "Billing Address"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.address_cc.v0/CS#HOME "Residence Address"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.address_cc.v0/CS#LEGAL "Legal Address"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.address_cc.v0/CS#MAILING "Mailing Address"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.address_cc.v0/CS#MEDREC "Medical Records Address"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.address_cc.v0/CS#OTHER "Other Address"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.address_cc.v0/CS#PERSONAL "Personal Address"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.address_cc.v0/CS#PRACTICE "Practice Address"


ValueSet: OLCarerContingencyPlanHasThePersonConsentedToTheReplacement
Title: "OL - Carer contingency plan: Has the person consented to the replacement"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0033 "Yes"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0034 "No"


ValueSet: OLCarerContingencyPlanReplacementHasConsentedToBeingContacted
Title: "OL - Carer contingency plan: Replacement has consented to being contacted"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0031 "Yes"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0032 "No"


ValueSet: OLCarerContingencyPlanReplacementHasConsentedToActingInThatRole
Title: "OL - Carer contingency plan: Replacement has consented to acting in that role"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0027 "Yes"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0028 "No"


ValueSet: OLCarerContingencyPlanReplacementHasACopyOfContingencyPlan
Title: "OL - Carer contingency plan: Replacement has a copy of contingency plan"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0029 "Yes"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.personal_responsibilities.v1/CS#at0030 "No"
