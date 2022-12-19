# IG design guidelines
## ILCore
* profiles to from ILCore wherever possible
* re-use terminology (valuesets/codesystems) from ILCore whever possible
* stay up to date with ILCore releases (set version in `sushi-config.yaml`)
* cooperate & report any profiles/terminology that would be useful for all Israeli projects to share to ILCore
* outstanding issues/topics for ILCore are tracked at https://github.com/vadi2/MRI-Scheduling/issues/24

## Gertner
* outstanding issues/topics for Gertner are tracked at https://github.com/vadi2/MRI-Scheduling/issues/2

## Modelling
* require as little mandatory data as possible, since:
    1. we don't know what kind of data will be available
    2. we'd like to be able to collect the maximal amount of data, even if it is not 100% complete
* for this reason, elements required for data collection are just marked as [Must Support](https://hl7.org/fhir/r4/elementdefinition-definitions.html#ElementDefinition.mustSupport). It is expected implementers will send data for MS elements should they have it in their system.
    * a small (very small) amount of elements can be [considered to be made mandatory](https://github.com/vadi2/MRI-Scheduling/issues/37), as without them data would not be meaningful
* for every Gertner variable to be collected,
    1. mark it as 'Must Support'
    2. map it in the 'Mapping' section to provide FHIR -> Gertner traceability
    3. create, or add to an existing one an example of use.
        1. Make sure to include all possible states whenever reasonable (ie if something can fail, include both the success and failure case)
* whenever a core FHIR resource is missing required functionality and it would be, subjectively, a good addition to FHIR since other systems might be using it - contract the relevant HL7 Work Group with the suggestion to add it
  * example - [cancellationDate](https://jira.hl7.org/browse/FHIR-38731)
* otherwise should the relevance too tightly scoped to the MRI project, define it as an example
  * example - when the patient first reached out for available appointment dates extension
* keep the amount of warnings/errors/informational messages in the QA report down to 0
  * if the issue is not applicable - add it to the `ignoreWarnings.txt` file
