Profile: MRIAppointment
Parent: Appointment
Id: mri-appointment
Title: "MRI Appointment"
Description: "מטרת פרופיל זה היא לייצג תור להליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
// example of using an extension that is defined in this guide
* extension contains MRIAppointmentDatesRequest named datesRequest 0..1 MS
* extension contains MRIAppointmentDatesResponse named datesResponse 0..1 MS
* extension contains MRIAppointmentCancellationDate named cancellationDate 0..1 MS
* supportingInformation.extension contains MRIPreviousAppointment named previousAppointment 0..1 MS
* cancelationReason MS
* slot 1..
// example of slicing to ensure at least one slot reference uses the MRISlot profile
* slot ^slicing.discriminator.type = #profile
* slot ^slicing.discriminator.path = "resolve()"
* slot ^slicing.rules = #open
* slot ^slicing.description = "Slicing to ensure that at least one MRI Slot reference exists"
* slot ^slicing.ordered = false
* slot contains MRISlot 1.. MS
* slot[MRISlot] only Reference(MRISlot)

// example of an extension definition within the guide
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
Description: "The previous appointment date which was cancalled/rebooked to this appointment instead. This is to be used only in case an appointment was booked and cancelled/rebooked, and shall not be used to represent a previous appointment that actually occurred."
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
* extension[datesRequest] -> "MRI_setting_Date"
* extension[cancellationDate] -> "MRI_Cancelation_Date"
* start -> "MRI_New_Appointment_Date"

Instance: cancelled-appointment
InstanceOf: MRIAppointment
Usage: #example
/* 
  Example of a minimum resource for a canceled MRI appointment (1/3 of the series).
  
  The patient requested available appointment dates at 2020-01-25 08:42, and received them at 2020-01-25 15:37, which were:
  
  1) 2020-01-29 08:45 (chosen by the patient)
  2) 2020-01-29 10:00
  
  On 2020-01-28 07:24:43, the patient cancelled the appointment because they had unexpectedly to bring their kids to school.
*/
Description: "דוגמה למשאב מינימלי לפגישת MRI מבוטלת (1/3 מהסדרה).

המטופל ביקש תאריכי תור פנויים ב-2020-01-25 08:42, וקיבל אותם ב-2020-01-25 15:37, שהיו:

1) 2020-01-29 08:45 (נבחר על ידי המטופל)
2) 2020-01-29 10:00

בתאריך 2020-01-28 07:24:43, המטופל ביטל את הפגישה כי נאלץ להביא את ילדיו לבית הספר באופן בלתי צפוי."
* extension[datesRequest].valueDateTime = "2020-01-25T08:42:00+02:00"
* extension[datesResponse].valueDateTime = "2020-01-25T15:37:00+02:00"
* extension[+].url = Canonical(MRIAppointmentCancellationDate)
* extension[=].valueDateTime = "2020-01-28T07:24:43+02:00"
* cancelationReason.text = "Have to bring kids to school"
* status = #cancelled
* participant
  * actor = Reference(minimal-patient)
  * required = #required
  * status = #declined
* start = "2020-01-29T08:45:00+02:00"
* end = "2020-01-29T09:30:00+02:00"
* slot[+] = Reference(cancelled-slot1)
* slot[+] = Reference(cancelled-slot2)

Instance: postponed-appointment
InstanceOf: MRIAppointment
Usage: #example
/*
  Example of a minimum resource for a postponed MRI appointment (2/3 of the series).
  
  The patient requested available appointment dates at 2020-02-05 10:00, and received them at 2020-02-05 12:39, which were:
  
  1) 2020-02-11 16:00 (chosen by the patient)
  2) 2020-02-13 09:30
  
  On 2020-02-10 13:28, the patient postponed the appointment.
*/
Description: "דוגמה למשאב מינימלי לפגישת MRI נדחה (2/3 מהסדרה).

המטופל ביקש תאריכי תור פנויים ב-2020-02-05 10:00, וקיבל אותם ב-2020-02-05 12:39, שהם:

1) 2020-02-11 16:00 (נבחר על ידי המטופל)
2) 2020-02-13 09:30

ביום 2020-02-10 13:28, המטופל דחה את התור."
* extension[datesRequest].valueDateTime = "2020-02-05T10:00:00+02:00"
* extension[datesResponse].valueDateTime = "2020-02-05T12:39:00+02:00"
* extension[+].url = Canonical(MRIAppointmentCancellationDate)
* extension[=].valueDateTime = "2020-02-10T13:28:00+02:00"
* status = #cancelled
* cancelationReason = CancellationReasonCodeSystem#postponed
* participant
  * actor = Reference(minimal-patient)
  * required = #required
  * status = #declined
* start = "2020-02-11T16:00:00+02:00"
* end = "2020-02-11T16:45:00+02:00"
* slot[+] = Reference(postponed-slot1)
* slot[+] = Reference(postponed-slot2)

Instance: minimal-appointment
InstanceOf: MRIAppointment
Usage: #example
Description: "דוגמה למשאב מינימלי לתור MRI שהוזמן ומחכה לקרות (3/3 בסדרה)"
* extension[datesRequest].valueDateTime = "2020-02-10T13:28:17+02:00"
* extension[datesResponse].valueDateTime = "2020-02-10T20:12:42+02:00"
* status = #booked
* start = "2020-02-16T10:00:00+02:00"
* end = "2020-02-16T11:30:00+02:00"
* slot[+] = Reference(first-available-slot)
* slot[+] = Reference(first-chosen-slot)
* slot[+] = Reference(third-available-slot)
* participant 
  * actor = Reference(minimal-patient)
  * required = #required
  * status = #accepted
* supportingInformation = Reference(cancelled-appointment)
* supportingInformation.extension[previousAppointment].valueBoolean = true
* supportingInformation = Reference(postponed-appointment)
* supportingInformation.extension[previousAppointment].valueBoolean = true
