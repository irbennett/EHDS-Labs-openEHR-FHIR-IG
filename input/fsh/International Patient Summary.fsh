Logical: InternationalPatientSummary
Title: "International Patient Summary"
Parent: Element
Description: """[openEHR-EHR-COMPOSITION.health_summary.v1] Generic document containing a summary of health information about an individual."""
* ^name = "InternationalPatientSummary"
* ^status = #active
* ^version = "1.3.0-alpha.26"
* ^url = "http://openehr.org/StructureDefinition/InternationalPatientSummary"
* category 1..1 DvCodedText "category" """[RM] Temporal category of this Composition, persistent / episodic or event."""
* category from InternationalPatientSummaryCategory (required)
* composer 1..1 PARTY_PROXY "composer" """[RM] The person primarily responsible for the content of the Composition (but not necessarily its committal into the EHR system). This is the identifier which should appear on the screen. It may or may not be the person who entered the data. When it is the patient, the special self instance of `PARTY_SELF` will be used."""
* context 1..1 EVENT_CONTEXT "context" """[RM] `COMPOSITION.context` - Documents the context information of a healthcare event involving the subject of care and the health system. The context information recorded here are independent of the attributes recorded in the version audit, which document the system interaction context, i.e. the context of a user interacting with the health record system. Healthcare events include patient contacts, and any other business activity, such as pathology investigations which take place on behalf of the patient."""
  * startTime 1..1 DvDateTime "start_time" """[RM] COMPOSITION.context.start_time - Start time of the clinical session or other kind of event during which a provider performs a service of any kind for the patient."""
  * setting 1..1 DvCodedText "setting" """[RM] The setting in which the clinical session took place. Coded using the openEHR Terminology, setting group."""
  * setting from InternationalPatientSummarySetting (required)
* problemList 0..1 SECTION "Problem List" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * ExclusionGlobal 0..1 EVALUATION "Exclusion - global" """[openEHR-EHR-EVALUATION.exclusion_global.v1] An overall statement of exclusion about all Problems/diagnoses, Family history, Medications, Procedures, Adverse reactions or other clinical items that are either not currently present, or have not been present in the past."""
    * globalExclusionOfProblemsDiagnoses 1..1 DvText "Global exclusion of problems/diagnoses" """[at0002] Overall statement of exclusion of all problems or diagnoses at the time of recording."""
  * AbsenceOfInformation 0..1 EVALUATION "Absence of information" """[openEHR-EHR-EVALUATION.absence.v2] Statement that specified health information is not available for inclusion in the health record or extract at the time of recording."""
    * absenceStatement 1..1 DvText "Absence statement" """[at0002] Positive statement that no information is available."""
    * reasonForAbsence 0..* DvText "Reason for absence" """[at0005] Description of the reason why there is no information available."""
  * ProblemDiagnosis 0..* EVALUATION "Problem/Diagnosis" """[openEHR-EHR-EVALUATION.problem_diagnosis.v1] Details about a single identified health condition, injury, disability or any other issue which impacts on the physical, mental and/or social well-being of an individual."""
    * problemDiagnosisName 1..1 DvCodedText "Problem/Diagnosis name" """[at0002] Identification of the problem or diagnosis, by name."""
    * problemDiagnosisName from InternationalPatientSummaryProblemDiagnosisName (required)
    * bodySite 0..* DvText "Body site" """[at0012] Identification of a simple body site for the location of the problem or diagnosis."""
    * dateTimeOfOnset 0..1 DvDateTime "Date/time of onset" """[at0077] Estimated or actual date/time that signs or symptoms of the problem/diagnosis were first observed."""
    * severity 0..1 DvCodedText "Severity" """[at0005] An assessment of the overall severity of the problem or diagnosis."""
    * severity from InternationalPatientSummarySeverity (preferred)
    * impact 0..* DvText "Impact" """[at0080] Overall assessment of the impact of a health problem for the specific patient. """
    * stage 0..1 Cluster "Stage" """[openEHR-EHR-CLUSTER.clinical_evidence.v1] Details about findings that support a clinical assertion."""
      * evidence 0..1 DvText "Evidence" """[at0003] Identification of an item of clinical evidence by name or type, either as a single result or as a grouping of results."""
      * result 0..1 DvText "Result" """[at0005] The result or finding that supports the assertion."""
    * clinicalEvidence 0..* Cluster "Clinical evidence" """[openEHR-EHR-CLUSTER.clinical_evidence.v1] Details about findings that support a clinical assertion."""
      * result 0..* DvText "Result" """[at0005] The result or finding that supports the assertion."""
    * dateTimeOfResolution 0..1 DvDateTime "Date/time of resolution" """[at0030] Estimated or actual date/time of resolution or remission for this problem or diagnosis, as determined by a healthcare professional."""
    * problemDiagnosisQualifier 0..1 Cluster "Problem/Diagnosis qualifier" """[openEHR-EHR-CLUSTER.problem_qualifier.v2] Contextual or temporal qualifier for a specified problem or diagnosis."""
      * activeInactive 0..1 DvCodedText "Active/Inactive?" """[at0003] Category that supports division of problems and diagnoses into Active or Inactive problem lists."""
      * activeInactive from InternationalPatientSummaryActiveInactive (required)
      * resolutionPhase 0..1 DvCodedText "Resolution phase" """[at0083] Phase of healing for an acute problem or diagnosis."""
      * resolutionPhase from InternationalPatientSummaryResolutionPhase (required)
      * remissionStatus 0..1 DvCodedText "Remission status" """[at0089] Status of the remission of an incurable diagnosis."""
      * remissionStatus from InternationalPatientSummaryRemissionStatus (required)
      * episodicity 0..1 DvCodedText "Episodicity" """[at0001] Category of this episode for the identified problem/diagnosis."""
      * episodicity from InternationalPatientSummaryEpisodicity (preferred)
      * occurrence 0..1 DvCodedText "Occurrence" """[at0071] Category of the occurrence for this problem or diagnosis."""
      * occurrence from InternationalPatientSummaryOccurrence (required)
      * comment 0..1 DvText "Comment" """[at0110] Additional narrative about the Problem/Diagnosis qualifier values, not captured in other fields."""
    * diagnosticCertainty 0..1 DvCodedText "Diagnostic certainty" """[at0073] The level of confidence in the identification of the diagnosis."""
    * diagnosticCertainty from InternationalPatientSummaryDiagnosticCertainty (preferred)
    * comment 0..1 DvText "Comment" """[at0069] Additional narrative about the problem or diagnosis not captured in other fields."""
* allergiesAndIntolerances 0..1 SECTION "Allergies and Intolerances" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * ExclusionGlobal 0..1 EVALUATION "Exclusion - global" """[openEHR-EHR-EVALUATION.exclusion_global.v1] An overall statement of exclusion about all Problems/diagnoses, Family history, Medications, Procedures, Adverse reactions or other clinical items that are either not currently present, or have not been present in the past."""
    * globalExclusionOfAdverseReactions 1..1 DvText "Global exclusion of adverse reactions" """[at0002] Overall statement of exclusion about all adverse reactions at the time of recording."""
  * AbsenceOfInformation 0..1 EVALUATION "Absence of information" """[openEHR-EHR-EVALUATION.absence.v2] Statement that specified health information is not available for inclusion in the health record or extract at the time of recording."""
    * absenceStatement 1..1 DvText "Absence statement" """[at0002] Positive statement that no information is available."""
    * reasonForAbsence 0..* DvText "Reason for absence" """[at0005] Description of the reason why there is no information available."""
  * AdverseReactionRisk 0..* EVALUATION "Adverse reaction risk" """[openEHR-EHR-EVALUATION.adverse_reaction_risk.v2] Clinical assessment of the propensity for an individual to experience a harmful or undesirable physiological response if exposed, or re-exposed, to a substance."""
    * substance 1..1 DvText "Substance" """[at0002] Identification of a substance, or substance class, that is considered to put the individual at risk of an adverse reaction event."""
    * activeInactiveStatus 0..1 DvCodedText "Active/inactive status" """[at0130] Status about whether the adverse reaction risk statement is active or inactive."""
    * activeInactiveStatus from InternationalPatientSummaryActiveInactiveStatus (preferred)
    * verificationStatus 0..1 DvCodedText "Verification status" """[at0063] Assertion about the certainty of the propensity, or potential future risk, of the identified 'Substance' to cause a reaction."""
    * verificationStatus from InternationalPatientSummaryVerificationStatus (preferred)
    * criticality 0..1 DvCodedText "Criticality" """[at0101] An indication of the potential for critical system organ damage or life threatening consequence."""
    * criticality from InternationalPatientSummaryCriticality (preferred)
    * category 0..1 DvText "Category" """[at0120] Category of the identified 'Substance'."""
    * onsetOfFirstReaction[x] 0..1 DvDateTime or DvDuration or DvText or DvInterval-DvDateTime or DvInterval-DvDuration "Onset of first reaction" "at0133: The onset of the first known occurrence of a reaction event."
    * reactionMechanism 0..1 DvText "Reaction mechanism" """[at0058] Identification of the underlying physiological mechanism for the adverse reaction."""
    * adverseReactionEvent 0..* Cluster "Adverse reaction event" """[openEHR-EHR-CLUSTER.adverse_reaction_event.v1] Information about a specific adverse reaction event caused by exposure to a specific substance."""
      * specificSubstance 0..1 DvText "Specific substance" """[at0001] The substance considered to be responsible for the specific adverse reaction event."""
      * manifestation 1..* DvText "Manifestation" """[at0006] Clinical symptoms and/or signs that are observed or associated with the adverse reaction."""
      * reactionDescription 0..1 DvText "Reaction description" """[at0007] Narrative description about the adverse reaction as a whole, including details of the manifestation if required."""
      * onsetOfReaction 0..1 DvDateTime "Onset of reaction" """[at0008] The date and/or time of the onset of the reaction."""
      * severityOfReaction 0..1 DvCodedText "Severity of reaction" """[at0010] Clinical assessment of the severity of the reaction event as a whole, potentially considering multiple different manifestations."""
      * severityOfReaction from InternationalPatientSummarySeverityOfReaction (preferred)
      * routeOfExposure 0..1 DvText "Route of exposure" """[at0017] The route by which the subject was exposed to the identified 'Specific substance'."""
      * comment 0..1 DvText "Comment" """[at0024] Additional narrative about the adverse reaction event not captured in other fields."""
* medicationSummary 0..1 SECTION "Medication Summary" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * MedicationStatement 0..* ACTION "Medication statement" """[openEHR-EHR-ACTION.medication.v1] Any activity related to the planning, scheduling, prescription management, dispensing, administration, cessation and other use of a medication, vaccine, nutritional product or other therapeutic item."""
    * careflowStep 0..1 DvCodedText "careflow_step" """[RM] `ISM_TRANSITION.care_flow_step` - The step in the careflow process which occurred as part of generating this action, e.g. dispense , start_administration. This attribute represents the clinical label for the activity, as opposed to current_state which represents the state machine (ISM) computable form. Defined in archetype."""
    * careflowStep from InternationalPatientSummaryCareflowStep (required)
    * time 1..1 DvDateTime "time" """[RM] `ACTION.time` - Point in time at which this action took place."""
    * medicationItem 0..1 DvText "Medication item" """[at0020] Name of the medication, vaccine or other therapeutic/prescribable item which was the focus of the activity."""
    * medicationDetails 0..1 Cluster "Medication details" """[openEHR-EHR-CLUSTER.medication.v2] Details about a medication or component of a medication, including strength, form and details of any specific constituents."""
      * name 0..1 DvText "Name" """[at0132] The name of the medication or medication component."""
      * form 0..* DvText "Form" """[at0071] The formulation or presentation of the medication or medication component."""
      * category 0..1 DvCodedText "Category" """[at0142] The category of the medication or medication component, with regard to manufacturing or preparation, and the number of ingredients."""
      * category from InternationalPatientSummaryCategory2 (preferred)
      * strengthPresentation 0..1 Cluster "Strength (presentation)" """[at0152] The strength of the medication or medication component, expressed as a ratio."""
        * strengthNumerator 1..1 DvQuantity "Strength numerator" """[at0153  | ] The numerator of the strength fraction."""
        * strengthDenominator 1..1 DvQuantity "Strength denominator" """[at0157  | ] The denominator of the strength fraction."""
      * strengthConcentration 0..1 DvQuantity "Strength (concentration)" """[at0115  | ] The strength of the medication or medication component, as a concentration."""
      * manufacturer 0..1 DvText "Manufacturer" """[at0151] The manufacturer of the medication or medication component."""
      * batchId[x] 0..* DvText or DvIdentifier "Batch ID" "at0150: The identifier assigned to the production batch by the manufacturer during production."
      * expiry 0..1 DvDateTime "Expiry" """[at0003] The expiry date and/or time of the medication or medication component, as given by the manufacturer or individual preparing the mixture."""
      * amount 0..1 DvQuantity "Amount" """[at0139  | ] The amount of medication or medication component."""
      * alternateAmount 0..1 DvQuantity "Alternate amount" """[at0148  | ] An equivalent representation of the amount of the medication or medication component."""
      * role 0..1 DvCodedText "Role" """[at0127] The role of the medication or medication component within a mixture."""
      * role from InternationalPatientSummaryRole (preferred)
      * description 0..1 DvText "Description" """[at0133] Narrative description of the medication or medication component where it is not possible to describe this fully using structured elements."""
    * dosage 0..1 Cluster "Dosage" """[openEHR-EHR-CLUSTER.dosage.v2] The combination of a medication amount and administration timing for a single day, in the context of a medication order or medication management."""
      * dose[x] 0..1 DvQuantity or DvInterval-DvQuantity "Dose" "at0144: The amount of medication administered at one time."
      * doseFormula[x] 0..1 DvText or DvQuantity "Dose formula" "at0135: The formula used to calculate the dose amount or administration rate where this is dependent on some other factor, such as body weight or surface area."
      * doseDescription 0..1 DvText "Dose description" """[at0178] Text description of the dose."""
      * timingDaily 0..1 Cluster "Timing - daily" """[openEHR-EHR-CLUSTER.timing_daily.v1] Structured information about the intended timing of a therapeutic or diagnostic activity within any 24 hour period."""
        * frequency[x] 0..1 DvQuantity or DvInterval-DvQuantity "Frequency" "at0003: The frequency as number of times per time period that the activity is to take place."
        * interval 0..1 DvDuration "Interval" """[at0014] The time interval or minimum and maximum range of an interval between each scheduled activity."""
        * specificTime[x] 0..* DvTime or DvInterval-DvTime "Specific time" "at0004: A specific time or interval of time when the activity should occur."
        * timingDescription 0..1 DvText "Timing description" """[at0027] Text description of the daily timing. This element is intended to allow implementers to use the structures for different timings without necessarily specifying the timings in a structured way."""
        * exactTimingCritical 0..1 DvBoolean "Exact timing critical?" """[at0023] Is exact timing of the activity critical to effectiveness, or patient safety or wellbeing?"""
        * asRequired 0..1 DvBoolean "As required" """[at0024] Record as True if the activity should only occur when the "As required criterion" is met."""
        * AsRequiredCriterion 0..1 DvText "'As required' criterion" """[at0025] The condition which triggers an 'As required' activity."""
        * specificEvent 0..* Cluster "Specific event" """[at0039] A specific, named time event that the activity should occur in relation to."""
          * eventName 0..1 DvText "Event name" """[at0026] The name of the event that triggers the activity to take place."""
          * timeOffset 0..1 DvDuration "Time offset" """[at0040] The period of time before or after the named event when the activity should take place. Negative durations can be used to signify that the activity should take place before the event."""
        * onOffCycle 0..* Cluster "On / off cycle" """[at0035] A cycle of activity where an on-off pattern is required."""
          * on 0..1 DvDuration "On" """[at0036] The period of time for which the activity should take place."""
          * off 0..1 DvDuration "Off" """[at0037] The period of time for which the activity should NOT take place."""
    * clinicalIndication 0..1 DvText "Clinical indication" """[at0156] The clinical reason for the medication activity."""
    * administrationDetails 0..1 Cluster "Administration details" """[at0140] Details of body site and administration of the medication."""
      * route 0..1 DvText "Route" """[at0147] The route by which the ordered item was, or is to be, administered into the subject's body."""
      * bodySite 0..1 DvText "Body site" """[at0141] Structured description of the site of administration of the ordered item."""
    * timingNonDaily 0..1 Cluster "Timing - non-daily" """[openEHR-EHR-CLUSTER.timing_nondaily.v1] Structured information about the intended timing pattern for a therapeutic or diagnostic activity occurring over days, weeks, months or years."""
      * repetitionInterval 0..1 DvDuration "Repetition interval" """[at0002] The interval between repetitions of the activity."""
      * daysPerTimePeriod[x] 0..1 DvQuantity or DvInterval-DvQuantity "Days per time period" "at0014: The number of days per time period on which the activity takes place."
      * activitiesPerTimePeriod[x] 0..1 DvQuantity or DvInterval-DvQuantity "Activities per time period" "at0022: The number of activities per time period."
      * specificDate[x] 0..* DvDate or DvInterval-DvDate "Specific date" "at0001: The activity should take place on a specific date or a specific range of dates."
      * specificDayOfWeek 0..7 DvCodedText "Specific day of week" """[at0003] The activity should take place on a specific day of the week."""
      * specificDayOfWeek from InternationalPatientSummarySpecificDayOfWeek (required)
      * specificDayOfMonth[x] 0..31 DvCount or DvInterval-DvCount "Specific day of month" "at0004: The activity should take place on a specific day or interval of days of the month."
      * timingDescription 0..1 DvText "Timing description" """[at0021] Text description of the timing."""
      * specificEvent 0..* Cluster "Specific event" """[at0006] The activity should take place in relation to a specific named event."""
        * eventName 0..1 DvText "Event name" """[at0005] The name of the event that triggers the activity to take place."""
        * timeOffset 0..1 DvDuration "Time offset" """[at0009] The period of time before or after the named event when the activity should take place. Negative durations can be used to signify that the activity should be taken before a known event."""
      * onOffCycle 0..1 Cluster "On / off cycle" """[at0010] A cycle of activity where an on-off pattern is required."""
        * on 0..1 DvDuration "On" """[at0011] The period of time for which the activity should take place."""
        * off 0..1 DvDuration "Off" """[at0012] The period of time for which the activity should NOT take place."""
    * orderId[x] 0..* DvIdentifier or DvText "Order ID" "at0103: Unique identifier for the medication order."
  * ExclusionGlobal 0..1 EVALUATION "Exclusion - global" """[openEHR-EHR-EVALUATION.exclusion_global.v1] An overall statement of exclusion about all Problems/diagnoses, Family history, Medications, Procedures, Adverse reactions or other clinical items that are either not currently present, or have not been present in the past."""
    * globalExclusionOfMedicationUse 1..1 DvText "Global exclusion of medication use" """[at0002] Overall statement of exclusion about the use of all medications at the time of recording."""
* immunizations 0..1 SECTION "Immunizations" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * ImmunizationStatement 0..* ACTION "Immunization statement" """[openEHR-EHR-ACTION.medication.v1] Any activity related to the planning, scheduling, prescription management, dispensing, administration, cessation and other use of a medication, vaccine, nutritional product or other therapeutic item."""
    * careflowStep 0..1 DvCodedText "careflow_step" """[RM] `ISM_TRANSITION.care_flow_step` - The step in the careflow process which occurred as part of generating this action, e.g. dispense , start_administration. This attribute represents the clinical label for the activity, as opposed to current_state which represents the state machine (ISM) computable form. Defined in archetype."""
    * careflowStep from InternationalPatientSummaryCareflowStep2 (required)
    * time 1..1 DvDateTime "time" """[RM] `ACTION.time` - Point in time at which this action took place."""
    * immunisationItem 0..1 DvText "Immunisation item" """[at0020] Name of the medication, vaccine or other therapeutic/prescribable item which was the focus of the activity."""
    * clinicalIndication 0..1 DvText "Clinical indication" """[at0156] The clinical reason for the medication activity."""
    * administrationDetails 0..1 Cluster "Administration details" """[at0140] Details of body site and administration of the medication."""
      * route 0..1 DvText "Route" """[at0147] The route by which the ordered item was, or is to be, administered into the subject's body."""
      * targetSite 0..1 DvText "Target site" """[at0141] Structured description of the site of administration of the ordered item."""
  * AbsenceOfInformation 0..1 EVALUATION "Absence of information" """[openEHR-EHR-EVALUATION.absence.v2] Statement that specified health information is not available for inclusion in the health record or extract at the time of recording."""
    * absenceStatement 1..1 DvText "Absence statement" """[at0002] Positive statement that no information is available."""
    * lastUpdated 0..1 DvDateTime "Last updated" """[at0004] The date at which the absence was last updated."""
* diagnosticResults 0..1 SECTION "Diagnostic Results" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * LaboratoryTestResult 0..* OBSERVATION "Laboratory test result" """[openEHR-EHR-OBSERVATION.laboratory_test_result.v1] The result, including findings and the laboratory's interpretation, of an investigation performed on specimens collected from an individual or related to that individual."""
    * anyEvent 0..* EVENT "Any event" """[at0002] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * testName 1..1 DvText "Test name" """[at0005] Name of the laboratory investigation performed on the specimen(s)."""
      * specimen 0..1 Cluster "Specimen" """[openEHR-EHR-CLUSTER.specimen.v1] A physical sample collected from, or related to, an individual for the purpose of investigation, examination or analysis."""
        * specimenType 0..1 DvText "Specimen type" """[at0029] The type of specimen."""
        * method 0..1 DvText "Method" """[at0007] The method of collection used."""
        * bodySite 0..1 DvText "Body site" """[at0087] Identification of the body site or other location from where the specimen is collected."""
      * diagnosticServiceCategory 0..1 DvText "Diagnostic service category" """[at0077] The diagnostic service or discipline that is responsible for the laboratory test result."""
      * laboratoryAnalyteResult 0..1 Cluster "Laboratory analyte result" """[openEHR-EHR-CLUSTER.laboratory_test_analyte.v1] The result of a laboratory test for a single analyte value."""
        * analyteName 0..1 DvText "Analyte name" """[at0024] The name of the analyte result."""
        * analyteResult[x] 0..* DvCodedText or DvText or DvMultimedia or DvParsable or DvState or DvBoolean or DvIdentifier or DvUri or DvEhrUri or DvDuration or DvQuantity or DvCount or DvProportion or DvDateTime or DvTime or DvOrdinal or DvScale "Analyte result" "at0001: The value of the analyte result."
        * testMethod[x] 0..1 DvCodedText or DvText or DvMultimedia or DvParsable or DvState or DvBoolean or DvIdentifier or DvUri or DvEhrUri or DvDuration or DvQuantity or DvCount or DvProportion or DvDateTime or DvTime or DvOrdinal or DvScale "Test method" "at0028: Description about the method used to perform the test on this analyte only."
      * interpretation 0..1 DvText "Interpretation" """[at0057] Narrative description of the key findings."""
      * mediaFile 0..1 Cluster "Media file" """[openEHR-EHR-CLUSTER.media_file.v1] A media file that is acquired or used as part of the healthcare process, and associated metadata."""
        * content 0..1 DvMultimedia "Content" """[at0001] Digital representation of the media file."""
        * contentName 0..1 DvText "Content name" """[at0002] Descriptive name or title for the media file."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * ImagingExaminationResult 0..* OBSERVATION "Imaging examination result" """[openEHR-EHR-OBSERVATION.imaging_exam_result.v1] The result of an imaging examination performed on an individual, using radiological techniques."""
    * anyEvent 0..* EVENT "Any event" """[at0002] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * studyName 1..1 DvText "Study name" """[at0004] The name of the imaging examination performed."""
      * modality 0..* DvText "Modality" """[at0091] The type of imaging device, process or method that originally acquired or produced the data used to create the images in the study."""
      * targetBodySite 0..1 DvText "Target body site" """[at0055] Description of the simple body site or region targetted for imaging."""
      * overallResultStatus 0..* DvCodedText "Overall result status" """[at0072] The status of the imaging examination result as a whole."""
      * overallResultStatus from InternationalPatientSummaryOverallResultStatus (preferred)
      * imagingFindings 0..1 DvText "Imaging findings" """[at0008] Narrative description or overview of all clinical findings."""
      * imagingExaminationOfABodyStructure 0..1 Cluster "Imaging examination of a body structure" """[openEHR-EHR-CLUSTER.imaging_exam.v1] Findings on radiological examination of a specified body structure or region."""
        * bodyStructure 1..1 DvText "Body structure" """[at0001] Identification of the body structure or region examined."""
        * bodySite 0..1 DvText "Body site" """[at0002] Identification of the area of the body under examination."""
        * imagingFindings 0..1 DvText "Imaging findings" """[at0004] Narrative description of the imaging findings observed during this examination."""
        * impression 0..* DvText "Impression" """[at0006] Single word, phrase or brief description that represents the clinical meaning and significance of all imaging findings for the identified body structure."""
        * comment 0..1 DvText "Comment" """[at0007] Additional narrative about the imaging findings of the body structure, not captured in other fields."""
      * comparisonFindings 0..1 DvText "Comparison findings" """[at0056] Narrative description about the comparison of this examination with previous similar studies."""
      * imagingQuality 0..1 DvText "Imaging quality" """[at0063] Assessment about the quality of the examination."""
      * imagingDifferentialDiagnosis 0..* DvText "Imaging differential diagnosis" """[at0058] Single word, phrase or brief description representing a possible condition or diagnosis."""
      * imagingDiagnosis 0..* DvText "Imaging diagnosis" """[at0020] Single word, phrase or brief description representing the likely condition or diagnosis."""
      * mediaFile 0..1 Cluster "Media file" """[openEHR-EHR-CLUSTER.media_file.v1] A media file that is acquired or used as part of the healthcare process, and associated metadata."""
        * content 0..1 DvMultimedia "Content" """[at0001] Digital representation of the media file."""
        * contentName 0..1 DvText "Content name" """[at0002] Descriptive name or title for the media file."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
    * technique 0..* DvText "Technique" """[at0087] Name of the radiological procedure used to capture the study."""
    * examinationRequestDetails 0..* Cluster "Examination request details" """[at0027] Details about a single imaging examination requested."""
      * receiverOrderIdentifier[x] 0..1 DvIdentifier or DvCodedText "Receiver order identifier" "at0031: Unique identifier for the imaging examination order assigned by the radiology service."
      * requesterOrderIdentifier[x] 0..1 DvIdentifier or DvText "Requester order identifier" "at0028: Unique identifier for the imaging examination order assigned by the requester."
      * examinationRequestedName 0..* DvText "Examination requested name" """[at0029] Identification of imaging examination requested."""
* advanceDirectives 0..1 SECTION "Advance Directives" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * AdvanceCareDirective 0..* EVALUATION "Advance care directive" """[openEHR-EHR-EVALUATION.advance_care_directive.v2] A framework to communicate the preferences of an individual for future medical treatment and care."""
    * typeOfDirective 0..1 DvText "Type of directive" """[at0005] The type of advance care directive."""
    * status 0..1 DvCodedText "Status" """[at0004] The status of the advance care directive."""
    * status from InternationalPatientSummaryStatus (preferred)
    * description 0..1 DvText "Description" """[at0006] Narrative description of the overall advance care directive."""
    * condition 0..* DvText "Condition" """[at0007] The conditions or situations in which the individual wishes the advance care directive to apply."""
    * comment 0..1 DvText "Comment" """[at0038] Additional narrative about the advance care directive not captured in other fields."""
    * validPeriodStart 0..1 DvDateTime "Valid period start" """[at0053] The date/time that marks the beginning of the valid period of time for this advance care directive."""
    * validPeriodEnd 0..1 DvDateTime "Valid period end" """[at0054] The date/time that marks the conclusion of the valid period of time for this advance care directive."""
    * reviewDueDate 0..1 DvDateTime "Review due date" """[at0056] The date at which the advance care directive is due to be reviewed."""
    * lastUpdated 0..1 DvDateTime "Last updated" """[at0055] The date when this advance directive record was last updated."""
    * mandate[x] 0..* DvText or DvUri "Mandate" "at0027: Description of any legislation or other authoritative guidance that apply."
    * directiveLocation 0..* Cluster "Directive location" """[at0058] Information about the physical or digital location of the Advance care directive."""
      * location[x] 0..1 DvText or DvUri "Location" "at0030: Physical or digital location of the Advance care directive."
  * AdvanceInterventionDecisions 0..1 EVALUATION "Advance intervention decisions" """[openEHR-EHR-EVALUATION.advance_intervention_decisions.v1] Anticipatory decisions about the overall intent of care and possible interventions (including treatments, activities, and diagnostic or therapeutic procedures), asserted by a clinician."""
    * intentOfCare 0..1 DvCodedText "Intent of care" """[at0002] The overall intent for future care and treatment for the individual."""
    * intentOfCare from InternationalPatientSummaryIntentOfCare (preferred)
    * rationale 0..1 DvText "Rationale" """[at0056] Narrative description about the logic and justification for the 'Intent of care' decision."""
    * decisionsDescription 0..1 DvText "Decisions description" """[at0008] Narrative description about all advance intervention decisions, including the CPR decision."""
    * cPRDecision 0..1 DvCodedText "CPR decision" """[at0009] Decision about the extent of cardiopulmonary resuscitation (CPR) intervention appropriate for this individual."""
    * cPRDecision from InternationalPatientSummaryCPRDecision (preferred)
    * perIntervention 0..* Cluster "Per intervention" """[at0014] Details of the decision about possible treatments or activities that may be life-saving, life-prolonging or cause undesirable side effects."""
      * intervention 1..1 DvCodedText "Intervention" """[at0015] Name of the possible treatment, procedure or activity."""
      * intervention from InternationalPatientSummaryIntervention (preferred)
      * decision 0..1 DvCodedText "Decision" """[at0034] Decision about the identified intervention."""
      * decision from InternationalPatientSummaryDecision (required)
      * precondition 0..* DvText "Precondition" """[at0039] Description of the circumstance/s in which a 'Conditional recommendation' is applicable."""
      * comment 0..1 DvText "Comment" """[at0040] Additional narrative about the intervention decision, not captured in other fields."""
    * patientAwareness 0..1 DvText "Patient awareness" """[at0042] Narrative description about awareness of the Advance intervention decisions by the individual."""
    * carerAwareness 0..1 DvText "Carer awareness" """[at0043] Narrative description about awareness of the Advance intervention decisions by family, carers or legal proxy."""
    * overallComment 0..1 DvText "Overall comment" """[at0044] Additional narrative about all advance intervention decisions, not captured in other fields."""
    * lastUpdated 0..1 DvDateTime "Last updated" """[at0046] The date and/or time when the Advance intervention decisions were last updated."""
    * validPeriodStart 0..1 DvDateTime "Valid period start" """[at0047] The date/time that marks the beginning of the valid period of time for the Advance intervention decisions."""
    * validPeriodEnd 0..1 DvDateTime "Valid period end" """[at0048] The date/time that marks the conclusion of the valid period of time for the Advance intervention decisions."""
    * reviewDue 0..1 DvDateTime "Review due" """[at0049] The date when review of the Advance intervention decisions are due."""
    * mandate[x] 0..1 DvText or DvEhrUri "Mandate" "at0050: Description of any legislation or other authoritative guidance that apply."
    * documentLocation 0..1 Cluster "Document location" """[at0052] Information about the physical or digital location of the advance intervention decisions record."""
      * location[x] 0..1 DvText or DvUri "Location" "at0053: Physical or digital location of the Advance intervention decisions record."
* historyOfProcedures 0..1 SECTION "History of Procedures" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * Procedure 0..1 ACTION "Procedure" """[openEHR-EHR-ACTION.procedure.v1] A clinical activity carried out for screening, investigative, diagnostic, curative, therapeutic, evaluative or palliative purposes."""
    * careflowStep 0..1 DvCodedText "careflow_step" """[RM] `ISM_TRANSITION.care_flow_step` - The step in the careflow process which occurred as part of generating this action, e.g. dispense , start_administration. This attribute represents the clinical label for the activity, as opposed to current_state which represents the state machine (ISM) computable form. Defined in archetype."""
    * careflowStep from InternationalPatientSummaryCareflowStep3 (required)
    * time 1..1 DvDateTime "time" """[RM] `ACTION.time` - Point in time at which this action took place."""
    * procedureName 1..1 DvText "Procedure name" """[at0002] Identification of the procedure by name."""
    * indication 0..* DvText "Indication" """[at0070] The clinical or process-related reason for the procedure."""
    * bodySite 0..* DvText "Body site" """[at0063] Identification of the body site for the procedure."""
  * AbsenceOfInformation 0..1 EVALUATION "Absence of information" """[openEHR-EHR-EVALUATION.absence.v2] Statement that specified health information is not available for inclusion in the health record or extract at the time of recording."""
    * absenceStatement 1..1 DvText "Absence statement" """[at0002] Positive statement that no information is available."""
    * lastUpdated 0..1 DvDateTime "Last updated" """[at0004] The date at which the absence was last updated."""
  * ExclusionGlobal 0..1 EVALUATION "Exclusion - global" """[openEHR-EHR-EVALUATION.exclusion_global.v1] An overall statement of exclusion about all Problems/diagnoses, Family history, Medications, Procedures, Adverse reactions or other clinical items that are either not currently present, or have not been present in the past."""
    * globalExclusionOfProcedures 1..1 DvText "Global exclusion of procedures" """[at0002] Overall statement of exclusion about all procedures at the time of recording."""
* medicalDevices 0..1 SECTION "Medical Devices" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * DeviceUseStatement 0..1 EVALUATION "Device use statement" """[openEHR-EHR-EVALUATION.device_summary.v0] An ongoing and persistent overview about medical devices that have been fitted or implanted."""
    * deviceDetails 0..* Cluster "Device details" """[at0022] Details about each device."""
      * deviceName 0..1 DvText "Device name" """[at0007] Identification of the specific device, by name."""
      * bodySite 0..1 DvText "Body site" """[at0012] Identification of the body site where the device is fitted/implanted."""
      * medicalDevice 0..1 Cluster "Medical device" """[openEHR-EHR-CLUSTER.device.v1] An instrument, apparatus, implant, material or similar, used in the provision of healthcare. In this context, a medical device includes a broad range of devices which act through a variety of physical, mechanical, thermal or similar means but specifically excludes devices which act through medicinal means such as pharmacological, metabolic or immunological methods.  The scope is inclusive of disposable devices as well as durable or persisting devices that require tracking, maintenance activities or regular calibration, recognising that each type of device has specific data recording requirements."""
        * deviceName 1..1 DvText "Device name" """[at0001] Identification of the medical device, preferably by a common name, a formal fully descriptive name or, if required, by class or category of device."""
        * type 0..1 DvText "Type" """[at0003] The category or kind of device."""
        * description 0..1 DvText "Description" """[at0002] Narrative description of the medical device."""
        * uniqueDeviceIdentifierUDI 0..1 DvIdentifier "Unique device identifier (UDI)" """[at0021] A numeric or alphanumeric string that is associated with this device within a given system."""
        * manufacturer 0..1 DvText "Manufacturer" """[at0004] Name of manufacturer."""
        * dateOfManufacture 0..1 DvDateTime "Date of manufacture" """[at0005] Date the device was manufactured."""
        * serialNumber 0..1 DvText "Serial number" """[at0020] Number assigned by the manufacturer which can be found on the device, and should be specific to each device., its label, or accompanying packaging."""
        * catalogueNumber 0..1 DvText "Catalogue number" """[at0022] The exact number assigned by the manufacturer, as it appears in the manufacturer's catalogue, device labeling, or accompanying packaging."""
        * modelNumber 0..1 DvText "Model number" """[at0023] The exact model number assigned by the manufacturer and found on the device label or accompanying packaging."""
        * batchLotNumber 0..1 DvText "Batch/Lot number" """[at0006] The number assigned by the manufacturer which identifies a group of items manufactured at the same time, usually found on the label or packaging material."""
        * softwareVersion 0..1 DvText "Software version" """[at0025] Identification of the version of software being used in the medical device."""
        * dateOfExpiry 0..1 DvDateTime "Date of expiry" """[at0007] Date after which the device/product is no longer fit for use, usually found on the device itself or printed on the accompanying packaging."""
        * otherIdentifier 0..* DvIdentifier "Other identifier" """[at0024] Unspecified identifier, which can be further specified in a template or at run time."""
        * comment 0..1 DvText "Comment" """[at0008] Additional narrative about the device not captured in other fields."""
* vitalSigns 0..1 SECTION "Vital Signs" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * BodyWeight 0..1 OBSERVATION "Body weight" """[openEHR-EHR-OBSERVATION.body_weight.v2] Measurement of the body weight of an individual."""
    * anyEvent 0..* EVENT "Any event" """[at0003] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * weight 1..1 DvQuantity "Weight" """[at0004  | kg[lb_av]g] The weight of the individual."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * HeightLength 0..1 OBSERVATION "Height/Length" """[openEHR-EHR-OBSERVATION.height.v2] Height, or body length, is measured from crown of head to sole of foot."""
    * anyEvent 0..* EVENT "Any event" """[at0002] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * heightLength 1..1 DvQuantity "Height/Length" """[at0004  | cm[in_i]] The length of the body from crown of head to sole of foot."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * Respiration 0..1 OBSERVATION "Respiration" """[openEHR-EHR-OBSERVATION.respiration.v2] The characteristics of spontaneous breathing by an individual."""
    * anyEvent 0..* EVENT "Any event" """[at0002] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * rate 0..1 DvQuantity "Rate" """[at0004  | /min] The frequency of spontaneous breathing."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * PulseHeartBeat 0..1 OBSERVATION "Pulse/Heart beat" """[openEHR-EHR-OBSERVATION.pulse.v2] The rate and associated attributes for a pulse or heart beat."""
    * anyEvent 0..* EVENT "Any event" """[at0003] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * rate 0..1 DvQuantity "Rate" """[at0004  | /min] The rate of the pulse or heart beat, measured in beats per minute."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * BodyTemperature 0..1 OBSERVATION "Body temperature" """[openEHR-EHR-OBSERVATION.body_temperature.v2] A measurement of the body temperature, which is a surrogate for the core body temperature of the individual."""
    * anyEvent 0..* EVENT "Any event" """[at0003] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * temperature 1..1 DvQuantity "Temperature" """[at0004  | Cel[degF]] The measured temperature."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * HeadCircumference 0..1 OBSERVATION "Head circumference" """[openEHR-EHR-OBSERVATION.head_circumference.v1] The measurement of the longest distance around the head."""
    * anyEvent 0..* EVENT "Any event" """[at0010] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * headCircumference 0..1 DvQuantity "Head circumference" """[at0004  | cm[in_i]] The measurement of the longest distance around the head."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * PulseOximetry 0..1 OBSERVATION "Pulse oximetry" """[openEHR-EHR-OBSERVATION.pulse_oximetry.v1] Blood oxygen and related measurements, measured by pulse oximetry or pulse CO-oximetry."""
    * anyEvent 0..* EVENT "Any event" """[at0002] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * spO2 0..1 DvProportion "SpO2" """[at0006] The saturation of oxygen in the peripheral blood, measured via pulse oximetry."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * BodyMassIndexBMI 0..1 OBSERVATION "Body Mass Index (BMI)" """[openEHR-EHR-OBSERVATION.body_mass_index.v2] Calculated measurement which compares a person's weight and height."""
    * anyEvent 0..* EVENT "Any event" """[at0002] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * bodyMassIndex 1..1 DvQuantity "Body mass index" """[at0004  | kg/m2[lb_av]/[in_i]2] Index describing ratio of weight to height."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
  * BloodPressure 0..1 OBSERVATION "Blood pressure" """[openEHR-EHR-OBSERVATION.blood_pressure.v2] The local measurement of arterial blood pressure which is a surrogate for arterial pressure in the systemic circulation."""
    * anyEvent 0..* EVENT "Any event" """[at0006] Default, unspecified point in time or interval event which may be explicitly defined in a template or at run-time."""
      * systolic 0..1 DvQuantity "Systolic" """[at0004  | mm[Hg]] Peak systemic arterial blood pressure  - measured in systolic or contraction phase of the heart cycle."""
      * diastolic 0..1 DvQuantity "Diastolic" """[at0005  | mm[Hg]] Minimum systemic arterial blood pressure - measured in the diastolic or relaxation phase of the heart cycle."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
* pastHistoryOfIllness 0..1 SECTION "Past History of Illness" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * ProblemDiagnosis 0..1 EVALUATION "Problem/Diagnosis" """[openEHR-EHR-EVALUATION.problem_diagnosis.v1] Details about a single identified health condition, injury, disability or any other issue which impacts on the physical, mental and/or social well-being of an individual."""
    * problemDiagnosisName 1..1 DvText "Problem/Diagnosis name" """[at0002] Identification of the problem or diagnosis, by name."""
    * variant 0..* DvText "Variant" """[at0079] Specific variant or subtype of the Diagnosis, if relevant."""
    * bodySite 0..* DvText "Body site" """[at0012] Identification of a simple body site for the location of the problem or diagnosis."""
    * cause 0..* DvText "Cause" """[at0078] A cause, set of causes, or manner of causation of the problem or diagnosis."""
    * dateTimeOfOnset 0..1 DvDateTime "Date/time of onset" """[at0077] Estimated or actual date/time that signs or symptoms of the problem/diagnosis were first observed."""
    * severity 0..1 DvCodedText "Severity" """[at0005] An assessment of the overall severity of the problem or diagnosis."""
    * severity from InternationalPatientSummarySeverity2 (preferred)
    * impact 0..* DvText "Impact" """[at0080] Overall assessment of the impact of a health problem for the specific patient. """
    * dateOfAbatement 0..1 DvDateTime "Date of abatement" """[at0030] Estimated or actual date/time of resolution or remission for this problem or diagnosis, as determined by a healthcare professional."""
    * problemDiagnosisQualifier 0..1 Cluster "Problem/Diagnosis qualifier" """[openEHR-EHR-CLUSTER.problem_qualifier.v2] Contextual or temporal qualifier for a specified problem or diagnosis."""
      * activeInactive 0..1 DvCodedText "Active/Inactive?" """[at0003] Category that supports division of problems and diagnoses into Active or Inactive problem lists."""
      * activeInactive from InternationalPatientSummaryActiveInactive2 (required)
      * resolutionPhase 0..1 DvCodedText "Resolution phase" """[at0083] Phase of healing for an acute problem or diagnosis."""
      * resolutionPhase from InternationalPatientSummaryResolutionPhase2 (required)
      * remissionStatus 0..1 DvCodedText "Remission status" """[at0089] Status of the remission of an incurable diagnosis."""
      * remissionStatus from InternationalPatientSummaryRemissionStatus2 (required)
      * occurrence 0..1 DvCodedText "Occurrence" """[at0071] Category of the occurrence for this problem or diagnosis."""
      * occurrence from InternationalPatientSummaryOccurrence2 (required)
    * diagnosticCertainty 0..1 DvCodedText "Diagnostic certainty" """[at0073] The level of confidence in the identification of the diagnosis."""
    * diagnosticCertainty from InternationalPatientSummaryDiagnosticCertainty2 (preferred)
    * lastUpdated 0..1 DvDateTime "Last updated" """[at0070] The date this problem or diagnosis was last updated."""
* pregnancy 0..1 SECTION "Pregnancy" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * PregnancySummary 0..1 EVALUATION "Pregnancy summary" """[openEHR-EHR-EVALUATION.pregnancy_summary.v0] Overview or summary record of a pregnancy and outcome, including the antenatal period, labour, birth and the immediate postnatal period."""
    * pregnancyStatus 0..1 DvText "Pregnancy status" """[at0181] Statement about the current status of a single pregnancy."""
    * pregnancyLabel[x] 0..1 DvText or DvCount "Pregnancy label" "at0146: An informal identifier assigned to the pregnancy, used to distinguish it from other pregnancies."
    * pregnancyConfirmed[x] 0..1 DvDateTime or DvUri or DvBoolean "Pregnancy confirmed" "at0158: Confirmation of the pregnancy."
    * pregnancySynopsis 0..1 DvText "Pregnancy synopsis" """[at0083] Narrative description about the entire pregnancy, labour and delivery, including complications."""
    * assistedReproduction 0..1 DvBoolean "Assisted reproduction?" """[at0104] Was the pregnancy a result of assisted reproductive technology?"""
    * assistedReproductionType 0..1 DvText "Assisted reproduction type" """[at0105] Type of assisted reproductive technology used to achieve pregnancy."""
    * earlyPregnancyOutcome 0..1 DvText "Early pregnancy outcome" """[at0094] Outcome of the pregnancy as a whole."""
    * pregnancyDuration 0..1 DvDuration "Pregnancy duration" """[at0159] The gestation when the pregnancy has ended."""
    * pregnancyEndDate 0..1 DvDateTime "Pregnancy end date" """[at0174] The date and/or time marking the end of the pregnancy."""
    * multiplePregnancy[x] 0..1 DvCodedText or DvText or DvBoolean "Multiple pregnancy?" "at0178: Assertion about whether the pregnancy is cateogrised as 'multiple pregnancy'."
    * onsetOfLabour 0..1 DvCodedText "Onset of labour" """[at0008] Manner in which labour started."""
    * onsetOfLabour from InternationalPatientSummaryOnsetOfLabour (required)
    * inductionMethod 0..* DvText "Induction method" """[at0096] Method of labour induction."""
    * reasonForInduction 0..* DvText "Reason for induction" """[at0097] Reason for induction of labour."""
    * augmentationMethod 0..* DvText "Augmentation method" """[at0022] Method of labour augmentation."""
    * totalDurationOfLabor 0..1 DvDuration "Total duration of labor" """[at0016] Total duration of all three stages of labour."""
    * perineum 0..1 DvCodedText "Perineum" """[at0118] Coded or narrative description about the condition of the perineum after birth, including injuries and repairs."""
    * perineum from InternationalPatientSummaryPerineum (preferred)
    * episiotomy 0..1 DvBoolean "Episiotomy" """[at0157] Was an episiotomy performed?"""
    * estimatedBloodLoss 0..1 DvQuantity "Estimated blood loss" """[at0119  | ml] Estimation of total maternal blood loss during birth and immediately postpartum."""
    * placeOfOutcome 0..1 DvText "Place of outcome" """[at0175] Simple details about the  location where the pregnancy was delivered or an alternative outcome of the pregnancy was treated or managed."""
    * placeCategory 0..1 DvText "Place category" """[at0173] Category of the place where the pregnancy was delivered or an alternative outcome of the pregnancy was treated or managed."""
    * maternalComplication 0..* Cluster "Maternal complication" """[at0065] Details about pregnancy complications or birth complications affecting the mother."""
      * complication 1..1 DvText "Complication" """[at0066] Identification of the complication."""
      * description 0..1 DvText "Description" """[at0068] Narrative description of the maternal complication."""
      * dateTimeOfOnset 0..1 DvDateTime "Date/Time of onset" """[at0067] Date of onset of complication, as assessed by a clinician."""
    * perInfant 0..* Cluster "Per infant" """[at0028] Information about a single fetus or newborn infant."""
      * labelName 0..1 DvText "Label/name" """[at0036] Identification of the infant."""
      * infantOutcome 0..1 DvText "Infant outcome" """[at0163] Outcome of the pregnancy for the identified infant or fetus."""
      * dateTimeOfDelivery 0..1 DvDateTime "Date/time of delivery" """[at0029] Date and time of delivery for the infant."""
      * assignedSex 0..1 DvCodedText "Assigned sex" """[at0037] Sex of the infant  by direct observation of external genitalia."""
      * assignedSex from InternationalPatientSummaryAssignedSex (required)
      * presentingPart 0..1 DvCodedText "Presenting part" """[at0045] Presenting part of the infant at delivery."""
      * presentingPart from InternationalPatientSummaryPresentingPart (preferred)
      * position 0..1 DvCodedText "Position" """[at0149] Position of the infant at delivery."""
      * position from InternationalPatientSummaryPosition (required)
      * birthweight 0..1 DvQuantity "Birthweight" """[at0038  | gkg] Weight of the infant at delivery."""
      * feeding 0..1 DvText "Feeding" """[at0109] Narrative description about feeding of the infant."""
      * neonatalOutcome 0..1 DvCodedText "Neonatal outcome" """[at0165] Description of the outcome at the end of the neonatal period per newborn infant."""
      * neonatalOutcome from InternationalPatientSummaryNeonatalOutcome (preferred)
      * neonatalSummary 0..1 DvText "Neonatal summary" """[at0170] Narrative description about issues, concerns about the infant or events occurring during the neonatal period."""
      * dateTimeOfNeonatalDeath 0..1 DvDateTime "Date/time of neonatal death" """[at0167] """
      * ageAtNeonatalDeath 0..1 DvDuration "Age at neonatal death" """[at0166] The age of the infant if they died during the neonatal  period."""
      * newbornComplication 0..* Cluster "Newborn complication" """[at0061] Details about any complications affecting the newborn."""
        * complication 1..1 DvText "Complication" """[at0062] Identification of the complication after birth."""
        * description 0..1 DvText "Description" """[at0064] Narrative description of complication."""
        * dateTimeOfOnset 0..1 DvDateTime "Date/time of onset" """[at0063] Date and/or time of onset of the complication."""
      * comment 0..1 DvText "Comment" """[at0182] Additional narrative about the infant, not captured in other fields."""
    * comment 0..1 DvText "Comment" """[at0183] Additional narrative about the pregnancy, not captured in other fields."""
  * EstimatedDateOfDeliveryEDD 0..1 EVALUATION "Estimated date of delivery (EDD)" """[openEHR-EHR-EVALUATION.estimated_date_delivery.v0] Estimated date of delivery for a pregnancy."""
    * eDDByDateOfConception 0..1 DvDateTime "EDD by date of conception" """[at0003] The EDD calculated from a known date of conception."""
    * eDDByCycle 0..1 DvDateTime "EDD by cycle" """[at0004] The EDD estimated from the onset of the last normal menstrual period by Naegle's method."""
    * byUltrasound 0..* Cluster "By ultrasound" """[at0006] Details about an EDD estimated from the findings on a pregnancy ultrasound."""
      * eDDByUltrasound 1..1 DvDateTime "EDD by ultrasound" """[at0008] Details about an EDD estimated from the findings on a pregnancy ultrasound."""
    * agreedEDD 0..1 Cluster "Agreed EDD" """[at0009] Details about the EDD which is used as the basis for clinical decision-making during the pregnancy."""
      * eDD 1..1 DvDateTime "EDD" """[at0010] The EDD which is to be used as the basis for clinical decision-making."""
    * lastUpdated 0..1 DvDateTime "Last updated" """[at0013] The date any EDD was last updated."""
  * ExclusionOfPregnancy 0..1 OBSERVATION "Exclusion of pregnancy" """[openEHR-EHR-OBSERVATION.exclusion_pregnancy.v0] Statement to explicitly record that a pregnancy was not present."""
    * anyEvent 0..* EVENT "Any event" """[at0002] """
      * exclusionStatement 0..1 DvText "Exclusion statement" """[at0006] An overall statement of exclusion about the state of pregnancy."""
      * time 1..1 DvDateTime "Time" """[RM] `OBSERVATION.EVENT.time` - Time of this Observation event. If the width is non-zero, it is the time point of the trailing edge of the event."""
* socialHistory 0..1 SECTION "Social History" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * TobaccoSmokingSummary 0..1 EVALUATION "Tobacco smoking summary" """[openEHR-EHR-EVALUATION.tobacco_smoking_summary.v1] Summary or persistent information about the tobacco smoking habits of an individual."""
    * overallStatus 0..1 DvCodedText "Overall status" """[at0089] Statement about current smoking behaviour for all types of tobacco."""
    * overallStatus from InternationalPatientSummaryOverallStatus (required)
  * AlcoholConsumptionSummary 0..1 EVALUATION "Alcohol consumption summary" """[openEHR-EHR-EVALUATION.alcohol_consumption_summary.v1] Summary or persistent information about the typical alcohol consumption of an individual."""
    * overallStatus 0..1 DvCodedText "Overall status" """[at0089] Statement about current consumption for all types of alcohol."""
    * overallStatus from InternationalPatientSummaryOverallStatus2 (required)
    * perEpisode 0..* Cluster "Per episode" """[at0064] Details about a discrete period of time with a consistent pattern of typical consumption."""
      * typicalConsumptionAlcoholUnits 0..1 DvQuantity "Typical consumption (alcohol units)" """[at0023  | 1/d1/wk1/mo] Estimate of number of alcohol units consumed."""
* planOfCare 0..1 SECTION "Plan of Care" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * CarePlan 0..1 ACTION "Care Plan" """[openEHR-EHR-ACTION.care_plan.v0] Plan or sequence of discrete activities developed to achieve a specified management goal or treatment outcome, carried out by health professionals and/or the patient."""
    * careflowStep 0..1 DvCodedText "careflow_step" """[RM] `ISM_TRANSITION.care_flow_step` - The step in the careflow process which occurred as part of generating this action, e.g. dispense , start_administration. This attribute represents the clinical label for the activity, as opposed to current_state which represents the state machine (ISM) computable form. Defined in archetype."""
    * careflowStep from InternationalPatientSummaryCareflowStep4 (required)
    * time 1..1 DvDateTime "time" """[RM] `ACTION.time` - Point in time at which this action took place."""
    * carePlanName 0..1 DvText "Care Plan Name" """[at0002] Name of care plan."""
    * plandescription 0..1 DvText "Description" """[at0021] Description of activity performed/enacted against the plan."""
    * reason 0..1 DvText "Reason" """[at0025] Reason for activity  being performed /enacted against the plan."""
    * carePlanID 0..1 DvIdentifier "Care Plan ID" """[at0016] Identification of care plan."""
    * expiryDate 0..1 DvDateTime "Expiry Date" """[at0017] Anticipated date beyond which the care plan can be deemed 'expired'."""
  * ServiceRequest 0..1 INSTRUCTION "Service request" """[openEHR-EHR-INSTRUCTION.service_request.v1] Request for a health-related service or activity to be delivered by a clinician, organisation or agency."""
    * narrative 1..1 DvText "narrative" """[RM] """
      * serviceName 1..1 DvText "Service name" """[at0121] The name of the service/s requested."""
      * serviceType 0..1 DvText "Service type" """[at0148] Category of service requested."""
      * description 0..1 DvText "Description" """[at0135] Narrative description about the service requested."""
      * clinicalIndication 0..* DvText "Clinical indication" """[at0152] The symptom, sign or diagnosis that necessitates the requested service."""
      * clinicalContext 0..1 DvText "Clinical context" """[at0154] Narrative information about the individual and their situation, providing relevant context for the request."""
      * reasonForRequest 0..* DvText "Reason for request" """[at0062] The specific problem needing attention or the clinical question that requires investigation."""
      * reasonDescription 0..1 DvText "Reason description" """[at0064] Narrative description about the issue or clinical query that needs resolution."""
      * intent 0..* DvText "Intent" """[at0065] Description of the intended outcome of the request."""
      * orderDetail 0..* DvText "Order detail" """[at0153] Additional details and instructions about how the services are to be delivered."""
      * urgency 0..1 DvCodedText "Urgency" """[at0068] Urgency of the request for service."""
      * urgency from InternationalPatientSummaryUrgency (preferred)
      * serviceDue[x] 0..1 DvDateTime or DvText or DvInterval-DvDateTime "Service due" "at0040: The date/time or description about timing for provision of the requested service/s."
      * supplementaryInformation 0..1 DvBoolean "Supplementary information" """[at0076] Supplementary information will be following request."""
      * informationDescription 0..1 DvText "Information description" """[at0078] Description of the supplementary information."""
      * comment 0..1 DvText "Comment" """[at0150] Additional narrative about the service request not captured in other fields."""
      * timing 1..1 DvParsable "Timing" """[RM] """
      * actionArchetypeId 1..1 string "Action_archetype_id" """[RM] """
    * requesterOrderIdentifier[x] 0..1 DvText or DvIdentifier "Requester order identifier" "at0010: The local identifier assigned by the requesting clinical system."
    * receiverOrderIdentifier[x] 0..1 DvText or DvIdentifier "Receiver order identifier" "at0011: The local identifier assigned to the request by the clinician or organisation receiving the request for service."
    * requestStatus 0..1 DvText "Request status" """[at0127] The status of the request for service as indicated by the requester."""
    * eligibilityGuidance 0..1 DvText "Eligibility guidance" """[at0158] Advice from the requester to the receiver about the individual's eligibility for the requested service."""
    * billingGuidance 0..1 DvText "Billing guidance" """[at0156] A recommendation from the requester to the receiver about the method of payment for the service."""
    * expiryTime 0..1 DvDateTime "expiry_time" """[RM] """
* functionalStatus 0..1 SECTION "Functional Status" """[openEHR-EHR-SECTION.adhoc.v1] A generic section header which should be renamed in a template to suit a specific clinical context."""
  * ProblemDiagnosis 0..1 EVALUATION "Problem/Diagnosis" """[openEHR-EHR-EVALUATION.problem_diagnosis.v1] Details about a single identified health condition, injury, disability or any other issue which impacts on the physical, mental and/or social well-being of an individual."""
    * problemDiagnosisName 1..1 DvText "Problem/Diagnosis name" """[at0002] Identification of the problem or diagnosis, by name."""
    * variant 0..* DvText "Variant" """[at0079] Specific variant or subtype of the Diagnosis, if relevant."""
    * bodySite 0..* DvText "Body site" """[at0012] Identification of a simple body site for the location of the problem or diagnosis."""
    * cause 0..* DvText "Cause" """[at0078] A cause, set of causes, or manner of causation of the problem or diagnosis."""
    * dateTimeOfOnset 0..1 DvDateTime "Date/time of onset" """[at0077] Estimated or actual date/time that signs or symptoms of the problem/diagnosis were first observed."""
    * severity 0..1 DvCodedText "Severity" """[at0005] An assessment of the overall severity of the problem or diagnosis."""
    * severity from InternationalPatientSummarySeverity3 (preferred)
    * impact 0..* DvText "Impact" """[at0080] Overall assessment of the impact of a health problem for the specific patient. """
    * dateOfAbatement 0..1 DvDateTime "Date of abatement" """[at0030] Estimated or actual date/time of resolution or remission for this problem or diagnosis, as determined by a healthcare professional."""
    * problemDiagnosisQualifier 0..1 Cluster "Problem/Diagnosis qualifier" """[openEHR-EHR-CLUSTER.problem_qualifier.v2] Contextual or temporal qualifier for a specified problem or diagnosis."""
      * activeInactive 0..1 DvCodedText "Active/Inactive?" """[at0003] Category that supports division of problems and diagnoses into Active or Inactive problem lists."""
      * activeInactive from InternationalPatientSummaryActiveInactive3 (required)
      * resolutionPhase 0..1 DvCodedText "Resolution phase" """[at0083] Phase of healing for an acute problem or diagnosis."""
      * resolutionPhase from InternationalPatientSummaryResolutionPhase3 (required)
      * remissionStatus 0..1 DvCodedText "Remission status" """[at0089] Status of the remission of an incurable diagnosis."""
      * remissionStatus from InternationalPatientSummaryRemissionStatus3 (required)
      * occurrence 0..1 DvCodedText "Occurrence" """[at0071] Category of the occurrence for this problem or diagnosis."""
      * occurrence from InternationalPatientSummaryOccurrence3 (required)
    * diagnosticCertainty 0..1 DvCodedText "Diagnostic certainty" """[at0073] The level of confidence in the identification of the diagnosis."""
    * diagnosticCertainty from InternationalPatientSummaryDiagnosticCertainty3 (preferred)
    * lastUpdated 0..1 DvDateTime "Last updated" """[at0070] The date this problem or diagnosis was last updated."""
  * ClinicalImpression 0..1 EVALUATION "Clinical impression" """[openEHR-EHR-EVALUATION.clinical_synopsis.v1] Narrative summary or overview about a patient, specifically from the perspective of a healthcare provider, and with or without associated interpretations."""
    * impression 1..1 DvText "Impression" """[at0002] The summary, assessment, conclusions or evaluation of the clinical findings."""

ValueSet: InternationalPatientSummaryCategory
Title: "International Patient Summary: category"
* http://openehr.org/archetypes/openEHR-EHR-COMPOSITION.health_summary.v1/CS#433 "event"


ValueSet: InternationalPatientSummarySetting
Title: "International Patient Summary: setting"


ValueSet: InternationalPatientSummaryProblemDiagnosisName
Title: "International Patient Summary: Problem/Diagnosis name"


ValueSet: InternationalPatientSummarySeverity
Title: "International Patient Summary: Severity"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0047 "Mild"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0048 "Moderate"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0049 "Severe"


ValueSet: InternationalPatientSummaryActiveInactive
Title: "International Patient Summary: Active/Inactive?"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0026 "Active"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0027 "Inactive"


ValueSet: InternationalPatientSummaryResolutionPhase
Title: "International Patient Summary: Resolution phase"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0084 "Resolved"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0097 "Relapsed"


ValueSet: InternationalPatientSummaryRemissionStatus
Title: "International Patient Summary: Remission status"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0090 "In remission"


ValueSet: InternationalPatientSummaryEpisodicity
Title: "International Patient Summary: Episodicity"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0034 "New"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0035 "Ongoing"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0070 "Indeterminate"


ValueSet: InternationalPatientSummaryOccurrence
Title: "International Patient Summary: Occurrence"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0096 "Recurrence"


ValueSet: InternationalPatientSummaryDiagnosticCertainty
Title: "International Patient Summary: Diagnostic certainty"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0074 "Suspected"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0075 "Probable"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0076 "Confirmed"


ValueSet: InternationalPatientSummaryActiveInactiveStatus
Title: "International Patient Summary: Active/inactive status"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.adverse_reaction_risk.v2/CS#at0131 "Active"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.adverse_reaction_risk.v2/CS#at0132 "Inactive"


ValueSet: InternationalPatientSummaryVerificationStatus
Title: "International Patient Summary: Verification status"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.adverse_reaction_risk.v2/CS#at0064 "Unconfirmed"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.adverse_reaction_risk.v2/CS#at0065 "Confirmed"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.adverse_reaction_risk.v2/CS#at0066 "Refuted"


ValueSet: InternationalPatientSummaryCriticality
Title: "International Patient Summary: Criticality"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.adverse_reaction_risk.v2/CS#at0102 "Low"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.adverse_reaction_risk.v2/CS#at0103 "High"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.adverse_reaction_risk.v2/CS#at0124 "Indeterminate"


ValueSet: InternationalPatientSummarySeverityOfReaction
Title: "International Patient Summary: Severity of reaction"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.adverse_reaction_event.v1/CS#at0011 "Mild"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.adverse_reaction_event.v1/CS#at0012 "Moderate"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.adverse_reaction_event.v1/CS#at0013 "Severe"


ValueSet: InternationalPatientSummaryCareflowStep
Title: "International Patient Summary: careflow_step"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0109 "Intended"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0157 "Medication double checked"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0006 "Dose administered"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0158 "Dose administration aborted"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0009 "On hold"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0007 "Completed"


ValueSet: InternationalPatientSummaryCategory2
Title: "International Patient Summary: Category"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0143 "Ad-hoc mixture"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0146 "Ingredient"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0144 "Multi-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0145 "Single-ingredient product"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0001 "Combination product"


ValueSet: InternationalPatientSummaryRole
Title: "International Patient Summary: Role"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0080 "Therapeutic"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0083 "Adjuvant"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.medication.v2/CS#at0084 "Excipient"


ValueSet: InternationalPatientSummarySpecificDayOfWeek
Title: "International Patient Summary: Specific day of week"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0007 "Monday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0008 "Tuesday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0016 "Wednesday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0017 "Thursday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0018 "Friday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0019 "Saturday"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.timing_nondaily.v1/CS#at0020 "Sunday"


ValueSet: InternationalPatientSummaryCareflowStep2
Title: "International Patient Summary: careflow_step"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0157 "Medication double checked"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0006 "Dose administered"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.medication.v1/CS#at0158 "Dose administration aborted"


ValueSet: InternationalPatientSummaryOverallResultStatus
Title: "International Patient Summary: Overall result status"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0073 "Registered"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0074 "Partial"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0075 "Preliminary"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0076 "Final"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0077 "Amended"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0078 "Corrected"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0079 "Appended"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0080 "Cancelled"
* http://openehr.org/archetypes/openEHR-EHR-OBSERVATION.imaging_exam_result.v1/CS#at0090 "Unknown"


ValueSet: InternationalPatientSummaryStatus
Title: "International Patient Summary: Status"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_care_directive.v2/CS#at0044 "Present"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_care_directive.v2/CS#at0045 "Absent"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_care_directive.v2/CS#at0047 "Unknown"


ValueSet: InternationalPatientSummaryIntentOfCare
Title: "International Patient Summary: Intent of care"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0003 "Curative"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0004 "Restorative"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0005 "Supportive"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0006 "Terminal"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0007 "Unknown"


ValueSet: InternationalPatientSummaryCPRDecision
Title: "International Patient Summary: CPR decision"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0010 "Full CPR"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0011 "Limited CPR"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0012 "No CPR"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0013 "Unknown"


ValueSet: InternationalPatientSummaryIntervention
Title: "International Patient Summary: Intervention"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0016 "Chest compressions"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0017 "Defibrillation"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0018 "Intubation"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0019 "Invasive ventilation"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0020 "Non-invasive ventilation"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0021 "Peripheral intravenous line"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0022 "Central venous line or any arterial line"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0023 "Parenteral fluids"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0024 "Parenteral or artificial nutrition"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0025 "Arrest medications"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0026 "Circulatory regulation medications"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0027 "Antibiotics, antiviral or antifungal agents"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0028 "Blood products"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0029 "Chest tube insertion"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0030 "Cardiac pacemaker"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0031 "Dialysis"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0032 "Transfer to hospital"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0033 "Transfer to Intensive Care"


ValueSet: InternationalPatientSummaryDecision
Title: "International Patient Summary: Decision"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0035 "Recommended"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0036 "Conditional recommendation"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0037 "Not recommended"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.advance_intervention_decisions.v1/CS#at0038 "Unknown"


ValueSet: InternationalPatientSummaryCareflowStep3
Title: "International Patient Summary: careflow_step"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.procedure.v1/CS#at0004 "Preparation"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.procedure.v1/CS#at0007 "Procedure request sent"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.procedure.v1/CS#at0038 "On hold"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.procedure.v1/CS#at0039 "Not done"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.procedure.v1/CS#at0068 "In progress"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.procedure.v1/CS#at0041 "Stopped"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.procedure.v1/CS#at0043 "Completed"


ValueSet: InternationalPatientSummarySeverity2
Title: "International Patient Summary: Severity"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0047 "Mild"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0048 "Moderate"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0049 "Severe"


ValueSet: InternationalPatientSummaryActiveInactive2
Title: "International Patient Summary: Active/Inactive?"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0026 "Active"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0027 "Inactive"


ValueSet: InternationalPatientSummaryResolutionPhase2
Title: "International Patient Summary: Resolution phase"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0084 "Resolved"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0097 "Relapsed"


ValueSet: InternationalPatientSummaryRemissionStatus2
Title: "International Patient Summary: Remission status"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0090 "In remission"


ValueSet: InternationalPatientSummaryOccurrence2
Title: "International Patient Summary: Occurrence"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0096 "Recurrence"


ValueSet: InternationalPatientSummaryDiagnosticCertainty2
Title: "International Patient Summary: Diagnostic certainty"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0074 "Suspected"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0075 "Probable"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0076 "Confirmed"


ValueSet: InternationalPatientSummaryOnsetOfLabour
Title: "International Patient Summary: Onset of labour"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0112 "No labour"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0009 "Spontaneous"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0010 "Induced"


ValueSet: InternationalPatientSummaryPerineum
Title: "International Patient Summary: Perineum"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0153 "First degree vaginal tear"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0154 "Second degree vaginal tear"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0155 "Third degree vaginal tear"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0156 "Fourth degree vaginal tear"


ValueSet: InternationalPatientSummaryAssignedSex
Title: "International Patient Summary: Assigned sex"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0113 "Male"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0114 "Female"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0115 "Indeterminate"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0176 "Intersex"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0177 "Unknown"


ValueSet: InternationalPatientSummaryPresentingPart
Title: "International Patient Summary: Presenting part"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0046 "Vertex"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0047 "Breech"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0048 "Face"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0049 "Brow"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0106 "Foot"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0107 "Arm"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0133 "Shoulder"


ValueSet: InternationalPatientSummaryPosition
Title: "International Patient Summary: Position"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0150 "Left occiput anterior/transverse"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0151 "Right occiput anterior/transverse"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0152 "Unknown"


ValueSet: InternationalPatientSummaryNeonatalOutcome
Title: "International Patient Summary: Neonatal outcome"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0168 "Live"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.pregnancy_summary.v0/CS#at0169 "Deceased"


ValueSet: InternationalPatientSummaryOverallStatus
Title: "International Patient Summary: Overall status"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.tobacco_smoking_summary.v1/CS#at0006 "Never smoked"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.tobacco_smoking_summary.v1/CS#at0003 "Current smoker"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.tobacco_smoking_summary.v1/CS#at0005 "Former smoker"


ValueSet: InternationalPatientSummaryOverallStatus2
Title: "International Patient Summary: Overall status"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.alcohol_consumption_summary.v1/CS#at0003 "Current drinker"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.alcohol_consumption_summary.v1/CS#at0005 "Former drinker"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.alcohol_consumption_summary.v1/CS#at0006 "Lifetime non-drinker"


ValueSet: InternationalPatientSummaryCareflowStep4
Title: "International Patient Summary: careflow_step"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0003 "Care plan Need Identified"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0008 "Care Plan Developed"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0034 "Care Plan Postponed"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0033 "Care Plan Cancelled"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0018 "Care Plan Scheduled"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0006 "Care Plan Commenced"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0020 "Care Plan Reviewed"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0035 "Care Plan Suspended"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0032 "Care Plan Aborted"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0010 "Care Plan Expired"
* http://openehr.org/archetypes/openEHR-EHR-ACTION.care_plan.v0/CS#at0013 "Care Plan Completed"


ValueSet: InternationalPatientSummaryUrgency
Title: "International Patient Summary: Urgency"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.service_request.v1/CS#at0136 "Emergency"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.service_request.v1/CS#at0137 "Urgent"
* http://openehr.org/archetypes/openEHR-EHR-INSTRUCTION.service_request.v1/CS#at0138 "Routine"


ValueSet: InternationalPatientSummarySeverity3
Title: "International Patient Summary: Severity"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0047 "Mild"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0048 "Moderate"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0049 "Severe"


ValueSet: InternationalPatientSummaryActiveInactive3
Title: "International Patient Summary: Active/Inactive?"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0026 "Active"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0027 "Inactive"


ValueSet: InternationalPatientSummaryResolutionPhase3
Title: "International Patient Summary: Resolution phase"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0084 "Resolved"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0097 "Relapsed"


ValueSet: InternationalPatientSummaryRemissionStatus3
Title: "International Patient Summary: Remission status"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0090 "In remission"


ValueSet: InternationalPatientSummaryOccurrence3
Title: "International Patient Summary: Occurrence"
* http://openehr.org/archetypes/openEHR-EHR-CLUSTER.problem_qualifier.v2/CS#at0096 "Recurrence"


ValueSet: InternationalPatientSummaryDiagnosticCertainty3
Title: "International Patient Summary: Diagnostic certainty"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0074 "Suspected"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0075 "Probable"
* http://openehr.org/archetypes/openEHR-EHR-EVALUATION.problem_diagnosis.v1/CS#at0076 "Confirmed"
