// see https://hl7.org/fhir/uv/shorthand/overview.html
// and https://hl7.org/fhir/uv/shorthand/reference.html for documentation

// titlecase naming here
Profile: MRIPatient
// lowercase naming with dashes here, aligned with ILCore
Id: mri-patient
// human-readable name - titlecase with spaces
Title: "MRI Patient"
// name of the parent comes from https://simplifier.net/ILCore/ILCorePatient/~json see "name" field
// if there is no parent in ILCore, the original fhir resource (like Patient) should then be parent
Parent: ILCorePatient
// FIXME: auto-translated
Description: "מטרת פרופיל זה היא להגדיר ייצוג של מטופל המבקש לקבל שירות MRI בהקשר של ניטור זמן רשימת ההמתנה של משרד הבריאות הישראלי.

The purpose of this profile is to define a representation of a patient requesting an MRI service, in the context of monitoring the waiting list times for the Israeli Ministry of Health."
// the language the profile is in. Does not say that the resource itself should be in Hebrew itself, just that the profile uses Hebrew
* ^language = LanguageCS#he "Hebrew"
* identifier[il-id] MS
* identifier[pna-id] MS


Mapping: PatientToX
Source:	MRIPatient
Target: "http://fhir.health.gov.il/mri"
Id: PatientMapping
Title: "Patient mapping to X"
Description: "Mapping of the patient profile to X" 	
* identifier[il-id] -> "ID_Type_code = 1"
* identifier[pna-id] -> "ID_Type_code"
// TODO: need to map "ID" and "temporary values"

Instance: patient-with-israeli-id
InstanceOf: MRIPatient
Usage: #example
* meta.profile = "http://fhir.health.gov.il/StructureDefinition/il-core-patient"
* extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-il-hmo"
* extension.valueCodeableConcept = http://fhir.health.gov.il/cs/paying-entity-moh#103 "קופת חולים מכבי"
* address.use = #home
* address.type = #physical
* address.text = "אלכסנדר פן 1א' דירה 4 תל אביב"
* address.line = "אלכסנדר פן 1א"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "פן אלכסנדר"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "1"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix"
* address.line.extension[=].valueString = "א'"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID"
* address.line.extension[=].valueString = "4"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
* address.line.extension[=].valueString = "1446"
* address.city = "תל אביב"
* address.city.extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-city-code"
* address.city.extension.valueCodeableConcept = http://fhir.health.gov.il/cs/city-symbol#5000
* address.postalCode = "6964101"
* address.district = "תל אביב"
* address.country = "ISR"
* identifier.system = "http://fhir.health.gov.il/identifier/il-national-id"
* identifier.value = "000000018"
* active = true
* name.family = "כהן"
* name.given = "תמר"
* name.text = "תמר כהן"
* telecom[0].system = #phone
* telecom[=].value = "052467911"
* telecom[=].use = #home
* telecom[+].system = #email
* telecom[=].value = "Israel@example.com"
* gender = #female
* birthDate = "2003-04-17"
* deceasedBoolean = false
