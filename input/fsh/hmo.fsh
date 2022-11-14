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
Description: "מטרת פרופיל זה היא להגדיר ייצוג של קופת חולים המאשרת שירות MRI, במסגרת מעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* identifier[moe-inst] MS 

Mapping: HMOToGertner
Source:	MRIHMO
Target: "http://www.gertnerinst.org.il"
Id: HMOMapping
Title: "מיפוי המידע האדמיניסטרטיבי של קופת החולים למודל נתוני רשימת המתנה MRI של גרטנר"
// TODO: is this the correct exact mapping?
* identifier[moe-inst] -> "HMO_code"

Instance: minimal-hmo
InstanceOf: MRIHMO
Usage: #example
Description: "דוגמה למשאב מינימלי של קופת חולים התואם לצרכי מדידת MRI"
* meta.profile = Canonical(MRIHMO)
* active = true
* name = "שנה אותי"
* address.text = "שנה אותי"

Instance: organization-ministry-of-health
InstanceOf: Organization
Usage: #example
Description: "דוגמה למשאב קופת חולים אמיתי יותר"
* meta.profile = Canonical(MRIHMO)
* identifier
  * system = "http://fhir.health.gov.il/identifier/legal-entity"
  * value = "500100904"
  * use = #official
* address
  * use = #work
  * type = #physical
  * text = "ירמיהו 39 ירושלים"
  * line = "ירמיהו 39"
  * line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
  * line.extension[=].valueString = "ירמיהו"
  * line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
  * line.extension[=].valueString = "39"
  * city = "ירושלים"
    * extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-city-code"
    * extension.valueCodeableConcept = http://fhir.health.gov.il/cs/city-symbol#3000
  * postalCode = "9446724"
  * country = "ISR"
* active = true
* name = "משרד הבריאות"
* telecom.system = #phone
* telecom.value = "08-6241010"
* telecom.use = #work
