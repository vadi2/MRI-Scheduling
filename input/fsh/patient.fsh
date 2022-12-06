// see https://hl7.org/fhir/uv/shorthand/overview.html
// and https://hl7.org/fhir/uv/shorthand/reference.html for documentation

// titlecase naming here
Profile: MRIPatient
// name of the parent comes from https://simplifier.net/ILCore/ILCorePatient/~json see "name" field
// if there is no parent in ILCore, the original fhir resource (like Patient) should then be parent
Parent: ILCorePatient
// lowercase naming with dashes here, aligned with ILCore
Id: mri-patient
// human-readable name - titlecase with spaces
Title: "MRI Patient"
// FIXME: auto-translated
Description: "מטרת פרופיל זה היא להגדיר ייצוג של מטופל המבקש לקבל שירות MRI בהקשר של ניטור זמן רשימת ההמתנה של משרד הבריאות הישראלי."
// example of marking a slice defined in IL Core as must support
* identifier[il-id] MS
* identifier[pna-id] MS
// example of marking an element in the Patient resource as must support
* birthDate MS
// example of changing the display text in the Patient profile table for an element
* birthDate ^short = "The year of birth for the individual" 
* gender MS
// example of adding a standard FHIR extension to this profile
* extension contains patient-genderIdentity named genderIdentity 0..1 MS  
// example of binding a standard FHIR extension that has already been added in the 
// parent ILCore Patient profile to a custom valueset
* extension[birthPlace].valueAddress.country from IsraelCountryVS (required)  
* extension[birthPlace].valueAddress.country ^short = "Israeli country code" 
// example of marking a standard FHIR extension that has already been added in the
// parent ILCore Patient profile as must support
* extension[birthPlace] MS
//* address.city.extension[cityCode] MS






Mapping: PatientToGertner
Source:	MRIPatient
Target: "http://www.gertnerinst.org.il"
Id: PatientMapping
Title: "מיפוי המידע האדמיניסטרטיבי של המטופל למודל נתוני רשימת ההמתנה של MRI של גרטנר"
// example of mapping a slice defined in the MRIPatient (or its parent) profile to a value
* identifier[il-id] -> "ID_Type_code"
* identifier[pna-id] -> "ID_Type_code"
// example of mapping an element in the core Patient resource to a value
* gender -> "Gender_code"
// example of mapping an extension defined in the MRIPatient (or its parent) profile to a value
* extension[genderIdentity] -> "Gender_code"
* extension[birthPlace] -> "birth_Country"
//* address.city.extension[cityCode] -> "City_code"
// TODO: need to map "ID" and "temporary values" 

Instance: minimal-patient
InstanceOf: MRIPatient
Usage: #example
Description: "דוגמה למשאב מטופל מינימלי התואם לצרכי מדידת MRI"
* meta.profile = Canonical(MRIPatient)
// example of the il-id identifier - the system value can be obtained from the ILCore Patient profile
* identifier.system = "http://fhir.health.gov.il/identifier/il-national-id"
* identifier.value = "000000018"
* name.family = "כהן"
* name.given = "שמואל"
* name.text = "שמואל כהן"
* birthDate = "1952"
* gender = #female
// example of using an extension that is defined at the root of the Patient resource in the ILCore Patient profile
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/patient-birthPlace"
* extension[=].valueAddress.country = IsraelCountryCodeSystem#670
// example of using an extension that is defined in Patient.address.city
* address.city.extension[+].url = "http://fhir.health.gov.il/StructureDefinition/ext-city-code"
* address.city.extension[=].valueCodeableConcept = CitySymbol#8

Instance: patient-with-israeli-id
InstanceOf: MRIPatient
Usage: #example
Description: "דוגמה למשאב מטופל אמיתי יותר"
* meta.profile = Canonical(MRIPatient)
* extension[+].url = "http://fhir.health.gov.il/StructureDefinition/ext-il-hmo"
* extension[=].valueCodeableConcept = http://fhir.health.gov.il/cs/paying-entity-moh#103 "קופת חולים מכבי"
* address
  * use = #home
  * type = #physical
  * text = "אלכסנדר פן 1א' דירה 4 תל אביב"
  * line = "אלכסנדר פן 1א"
    * extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
    * extension[=].valueString = "פן אלכסנדר"
    * extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
    * extension[=].valueString = "1"
    * extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-buildingNumberSuffix"
    * extension[=].valueString = "א'"
    * extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-unitID"
    * extension[=].valueString = "4"
    * extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-postBox"
    * extension[=].valueString = "1446"
  * city = "תל אביב"
    * extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-city-code"
    * extension.valueCodeableConcept = http://fhir.health.gov.il/cs/city-symbol#5000
  * postalCode = "6964101"
  * district = "תל אביב"
  * country = "ISR"
* identifier.system = "http://fhir.health.gov.il/identifier/il-national-id"
* identifier.value = "000000018"
* active = true
* name.family = "כהן"
* name.given = "תמר"
* name.text = "תמר כהן"
* telecom[+].system = #phone
* telecom[=].value = "052467911"
* telecom[=].use = #home
* telecom[+].system = #email
* telecom[=].value = "Israel@example.com"
* gender = #female
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/patient-genderIdentity"
* extension[=].valueCodeableConcept =  GenderIdentity#transgender-male
* birthDate = "2003-04-17"
* deceasedBoolean = false
* extension[+].url = "http://hl7.org/fhir/StructureDefinition/patient-birthPlace"
* extension[=].valueAddress.country =  IsraelCountryCodeSystem#670


