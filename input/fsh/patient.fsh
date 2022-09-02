Profile: MyPatient
Parent: ILCorePatient
Description: "An example profile of the Patient resource."
* name 1..* MS

Instance: patient-with-israeli-id
InstanceOf: MyPatient
Usage: #example
* meta.profile = "http://fhir.health.gov.il/StructureDefinition/il-core-patient"
* extension.url = "http://fhir.health.gov.il/StructureDefinition/ext-il-hmo"
* extension.valueCodeableConcept = http://fhir.health.gov.il/cs/paying-entity-moh#103 "קופת חולים מכבי"
* address.extension.extension[0].url = "longitude"
* address.extension.extension[=].valueDecimal = 182468.59
* address.extension.extension[+].url = "latitude"
* address.extension.extension[=].valueDecimal = 670131.38
* address.extension.url = "http://hl7.org/fhir/StructureDefinition/geolocation"
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

Mapping: PatientToX
Source:	MyPatient
Target: "http://fhir.health.gov.il/mri"
Id: PatientMapping
Title: "Patient mapping to X"
Description: "Mapping of the patient profile to X" 	
* name -> "<Gertner variable name>"
