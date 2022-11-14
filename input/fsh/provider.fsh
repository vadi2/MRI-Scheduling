Profile: MRIProvider
Parent: ILCoreOrganization
Id: mri-provider
Title: "MRI Provider"
// FIXME: auto-translated
Description: "מטרת פרופיל זה היא להגדיר נציגות של ארגון בריאות המספק שירות MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier contains mriProvider 1..1
* identifier[mriProvider]
  * value from ProviderCodesVS (required)
  * system = Canonical(ProviderCodesCodeSystem)

Mapping: ProviderToGertner
Source:	MRIProvider
Target: "http://www.gertnerinst.org.il"
Id: ProviderMapping
Title: "מיפוי המידע האדמיניסטרטיבי של ספק ה-MRI למודל נתוני רשימת ההמתנה של ה-MRI של גרטנר"

Instance: minimal-provider
InstanceOf: MRIProvider
Usage: #example
Description: "דוגמה למשאב מינימלי של ספק MRI התואם את צורכי מדידת ה-MRI"
* meta.profile = Canonical(MRIProvider)
* identifier[mriProvider]
  * system = "http://fhir.health.gov.il/mri/CodeSystem/provider-codes"
  * value = "1503"
* active = true
* name = "בי\"ח האיטלקי נצרת"
* address
  * use = #work
  * type = #physical
  * text = "הגליל פינת 6004, St, Nazareth, Israel"
  * line = "6004 הגליל פינת"
  * line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-streetName"
  * line.extension[=].valueString = "הגליל פינת"
  * line.extension[+].url = "http://hl7.org/fhir/StructureDefinition/iso21090-ADXP-houseNumber"
  * line.extension[=].valueString = "6004"
  * city = "Nazareth"
  * country = "ISR"
