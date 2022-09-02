Profile: MyPatient
Parent: Patient
Description: "An example profile of the Patient resource."
* name 1..* MS

Instance: PatientExample
InstanceOf: MyPatient
Description: "An example of a patient with a license to krill."
* name
  * given[0] = "James"
  * family = "Pond"

Mapping: PatientToX
Source:	MyPatient
Target: "http://fhir.health.gov.il/mri"
Id: PatientMapping
Title: "Patient mapping to X"
Description: "Mapping of the patient profile to X" 	
* name -> "<Gertner variable name>"
