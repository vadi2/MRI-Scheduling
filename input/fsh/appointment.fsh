Profile: MRIAppointment
Parent: Appointment
Id: mri-appointment
Title: "MRI Appointment"
Description: "מטרת פרופיל זה היא לייצג תור להליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* extension contains MRIAppointmentDatesRequest named datesRequest 0..1 MS
* extension contains MRIAppointmentDatesResponse named datesResponse 0..1 MS

Extension: MRIAppointmentDatesRequest
Id: appointment-dates-request
Title: "Extension: initial date when the patient contacted and requested available dates for making an appointment"
Description: "הארכה: מועד ראשוני בו המטופל פנה וביקש תאריכים פנויים לקביעת תור"
* value[x] only dateTime

Extension: MRIAppointmentDatesResponse
Id: appointment-dates-response
Title: "Extension: date when available appointment dates were provided to the patient"
Description: "הארכה: תאריך שבו נמסרו למטופל תאריכי תור פנויים"
* value[x] only dateTime


Mapping: AppointmentToGertner
Source: MRIAppointment
Target: "http://www.gertnerinst.org.il"
Id: AppointmentMapping
Title: "מיפוי מידע קליני על פגישה למודל נתוני רשימת המתנה של MRI של גרטנר."

Instance: minimal-appointment
InstanceOf: MRIAppointment
Usage: #example
Description: "דוגמה למשאב זימון מינימלי התואם את צורכי מדידת ה-MRI."
* extension[datesRequest].valueDateTime = "2020-02-07T13:28:17+02:00"
* extension[datesResponse].valueDateTime = "2020-02-07T20:12:42+02:00"
* status = #booked
* participant 
  * actor = Reference(minimal-patient)
  * required = #required
  * status = #accepted
