Profile: MRIProcedure
Parent: ILCoreProcedure
Id: mri-procedure
Title: "MRI Procedure"
// FIXME: auto-translated
Description: "מטרת פרופיל זה היא להגדיר ייצוג של הליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* performer ^slicing.discriminator.type = #profile
* performer ^slicing.discriminator.path = "actor.resolve()"
* performer ^slicing.rules = #open
* performer ^slicing.ordered = false
* performer contains mriProvider 0..1 MS
* performer[mriProvider] ^short = "Health provider where the MRI took place"
  * actor only Reference(MRIProvider) 
    * ^short = "Reference to the organization"
  * onBehalfOf only Reference(MRIProvider)

* code from MriTypeCodesVS (required)
* code and location and performedDateTime and report MS
* report only Reference(MRIDiagnosticReport)

* usedCode MS
* usedCode ^slicing.discriminator.type = #value
* usedCode ^slicing.discriminator.path = "coding.system"
* usedCode ^slicing.rules = #open
* usedCode ^slicing.ordered = false
* usedCode contains mriDevice 0..1 MS
* usedCode[mriDevice].coding.system 1..1
* usedCode[mriDevice].coding.system = MriDeviceNumber

Mapping: ProcedureToGertner
Source: MRIProcedure
Target: "http://www.gertnerinst.org.il"
Id: ProcedureMapping
Title: "מיפוי המידע האדמיניסטרטיבי והקליני של פרוצדורה למודל נתוני רשימת המתנה MRI של גרטנר."
* performer.actor -> "MRI_Provider_Code"
* performer.onBehalfOf -> "MRI_Provider_Code"
* code -> "MRI_Type_Code"
* location -> "MRI_Execution_Place"
* performedDateTime -> "MRI_Execution_Date"
* performedDateTime -> "MRI_Execution_Time"
* usedCode -> "MRI_device_number"

Instance: minimal-procedure
InstanceOf: MRIProcedure
Usage: #example
Description: "דוגמה למשאב מינימלי של הליך התואם את צורכי מדידת ה-MRI"
* meta.profile = Canonical(MRIProcedure)
* status = #completed
* code = MedicalServiceMoH#74181 "MRI בטן, לנבדק ליום"
* subject = Reference(minimal-patient)
* performedDateTime = "2013-04-05"
* performer
  * actor = Reference(minimal-provider)
  * onBehalfOf = Reference(minimal-provider)
* report = Reference(minimal-diagnosticreport)
* usedCode = MriDeviceNumber#3451
