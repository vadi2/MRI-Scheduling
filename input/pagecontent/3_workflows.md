<div dir="rtl" markdown="1">

# Technical overview

<!-- Overview of data, actors and resource exchange.

For a detailed explanation of the process, see the descriptions [after the diagram](Appointment-scheduling---MRI Provider). -->
סקירה של נתונים, שחקנים וחילופי משאבים.

להסבר מפורט על התהליך, עיין בתיאורים [אחרי התרשים](#appointment-scheduling---mri-provider).

<div dir="ltr">{% include workflow-with-moh.svg %}</div>
<br clear="all"/>

## Appointment scheduling - MRI Provider
<!-- The patient will first go to the doctor (private or HMO), have a consultation and receive a referral. With a referral obtained, the next step would be to schedule an appointment with an MRI provider. Once that is done (an appointment has been scheduled), the MRI provider shall send patient demographic and appointment details to the MoH using MRIPatient and MRIAppointment.
-->

המטופל יפנה תחילה לרופא (פרטי או קופת חולים), יערך ייעוץ ויקבל הפניה. עם קבלת הפניה, השלב הבא יהיה לקבוע פגישה עם ספק MRI. לאחר שהדבר נעשה (נקבע תור), ספק ה-MRI ישלח את פרטי המטופל ופרטי התור למשרד הבריאות באמצעות [MRIPatient] ו-[MRIAppointment].

**Request URL**

POST [base]/Patient

**Request body**.

<!-- Example of a Patient resource with the minimal information necessary: -->
דוגמה למשאב מטופל עם המידע המינימלי הדרוש: [minimal-patient]

<!-- Another example of a Patient resource with optional information included: -->
דוגמה נוספת למשאב מטופל עם מידע אופציונלי כללה: [patient-with-israeli-id]

## Form 17 - HMO

## Appointment cancellation (optional) - MRI Provider

## Appointment postponement (optional) - MRI Provider

## Procedure report - HMO

## Procedure report - MRI Provider

</div>

{% include markdown-link-references.md %}
