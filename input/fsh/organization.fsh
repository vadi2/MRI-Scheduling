// see https://hl7.org/fhir/uv/shorthand/overview.html
// and https://hl7.org/fhir/uv/shorthand/reference.html for documentation

// titlecase naming here
Profile: MRIHMO
// name of the parent comes from https://simplifier.net/ILCore/ILCoreOrganization/~json see "name" field
// if there is no parent in ILCore, the original fhir resource (like Organization) should then be parent
Parent: ILCoreOrganization
// lowercase naming with dashes here, aligned with ILCore
Id: mri-hmo
// human-readable name - titlecase with spaces
Title: "MRI HMO"
// FIXME: auto-translated
Description: "מטרת פרופיל זה היא להגדיר ייצוג של קופת חולים המאשרת שירות MRI, במסגרת מעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי.

The purpose of this profile is to define a representation of an HMO approving an MRI service, in the context of monitoring the waiting list times for the Israeli Ministry of Health."
* identifier[moe-inst] MS 

Mapping: HMOToGertner
Source:	MRIHMO
Target: "http://fhir.health.gov.il/mri"
Id: HMOMapping
Title: "Mapping of HMO's administrative information to Gertner's MRI waitlist data model"
// TODO: is this the correct exact mapping?
* identifier[moe-inst] -> "HMO_code"

Instance: minimal-hmo
InstanceOf: MRIHMO
Usage: #example
* meta.profile = Canonical(MRIHMO)
* active = true
* name = "שנה אותי"
* address.text = "שנה אותי"

Instance: organization-ministry-of-health
InstanceOf: Organization
Usage: #example
* meta.profile = Canonical(MRIHMO)
* identifier.system = "http://fhir.health.gov.il/identifier/legal-entity"
* identifier.value = "500100904"
* identifier.use = #official
* address.use = #work
* address.type = #physical
* address.text = "ירמיהו 39 ירושלים"
* address.line = "ירמיהו 39"
* address.line.extension[0].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
* address.line.extension[=].valueString = "ירמיהו"
* address.line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
* address.line.extension[=].valueString = "39"
* address.city = "ירושלים"
* address.city.extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-city-code"
* address.city.extension.valueCodeableConcept = http://fhir.health.gov.il/cs/city-symbol#3000
* address.postalCode = "9446724"
* address.country = "ISR"
* active = true
* name = "משרד הבריאות"
* telecom.system = #phone
* telecom.value = "08-6241010"
* telecom.use = #work
