Profile: MRIAppointment
Parent: Appointment
Id: mri-appointment
Title: "MRI Appointment"
Description: "מטרת פרופיל זה היא לייצג תור להליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* extension contains MRIAppointmentDatesRequest named datesRequest 0..1 MS
* extension contains MRIAppointmentDatesResponse named datesResponse 0..1 MS
* extension contains MRIAppointmentCancellationDate named cancellationDate 0..1 MS
* supportingInformation.extension contains MRIPreviousAppointment named previousAppointment 0..1 MS
* cancelationReason MS

Extension: MRIAppointmentDatesRequest
Id: appointment-dates-request
Title: "Initial date when the patient requested available dates for making an appointment"
Description: "הארכה: מועד ראשוני בו המטופל ביקש תאריכים פנויים לקביעת תור"
* ^context.type = #element
* ^context.expression = "Appointment"
* value[x] only dateTime

Extension: MRIAppointmentDatesResponse
Id: appointment-dates-response
Title: "Date when available appointment dates were provided to the patient"
Description: "הארכה: תאריך שבו נמסרו למטופל תאריכי תור פנויים"
* ^context.type = #element
* ^context.expression = "Appointment"
* value[x] only dateTime

Extension: MRIPreviousAppointment
Id: previous-appointment
Title: "The previous appointment date which was rebooked"
Description: "The previous appointment date which was cancalled/rebooked to this appointment instead. This is to be used only in case an appointment was booked and cancelled/rebooked, and shall not be used to represent a previous appoiment that actually occurred."
* ^context.type = #element
* ^context.expression = "Appointment.supportingInformation"
* value[x] only boolean

// the need for this was logged as https://jira.hl7.org/browse/FHIR-38731
// and this extension is modelled after the one WG decided on
Extension: MRIAppointmentCancellationDate
Id: appointment-cancellation-date
Title: "The date/time describing when the appointment was cancelled"
Description: "הארכה: התאריך/שעה המתארים מתי הפגישה בוטלה"
* ^context.type = #element
* ^context.expression = "Appointment"
* value[x] only dateTime

Mapping: AppointmentToGertner
Source: MRIAppointment
Target: "http://www.gertnerinst.org.il"
Id: AppointmentMapping
Title: "מיפוי מידע קליני על פגישה למודל נתוני רשימת המתנה של MRI של גרטנר."
* extension[datesRequest] -> "MRI_provider_dates_request"
* extension[datesResponse] -> "MRI_provider_dates_response"
* extension[cancellationDate] -> "MRI_Cancelation_Date"
* supportingInformation.extension[previousAppointment] -> "MRI_Prev_Appointment_Date"
* cancelationReason -> "MRI_cancelation_reason"

Instance: minimal-appointment
InstanceOf: MRIAppointment
Usage: #example
Description: "דוגמה למשאב זימון מינימלי התואם את צורכי מדידת ה-MRI."
* extension[datesRequest].valueDateTime = "2020-02-07T13:28:17+02:00"
* extension[datesResponse].valueDateTime = "2020-02-07T20:12:42+02:00"
* status = #booked
* start = "2020-02-10T10:00:00+02:00"
* end = "2020-02-10T11:30:00+02:00"
* slot[+] = Reference(first-available-slot)
* slot[+] = Reference(first-chosen-slot)
* slot[+] = Reference(third-available-slot)
* participant 
  * actor = Reference(minimal-patient)
  * required = #required
  * status = #accepted
* supportingInformation = Reference(cancelled-appointment)
* supportingInformation.extension[previousAppointment].valueBoolean = true

Instance: cancelled-appointment
InstanceOf: MRIAppointment
Usage: #example
Description: "בוטלה דוגמה למשאב מינימלי לתורים, התואם את צורכי מדידת ה-MRI."
* extension[+].url = Canonical(MRIAppointmentCancellationDate)
* extension[=].valueDateTime = "2020-01-28T02:24:43+02:00"
* cancelationReason.text = "Have to bring kids to school"
* status = #cancelled
* participant
  * actor = Reference(minimal-patient)
  * required = #required
  * status = #declined
* start = "2020-01-29T08:45:00+02:00"
* end = "2020-02-29T09:30:00+02:00"
