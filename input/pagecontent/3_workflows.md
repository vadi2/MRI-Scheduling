<div dir="rtl" markdown="1">

# Technical overview

<!-- Overview of data, actors and resource exchange.

For a detailed explanation of the process, see the descriptions [after the diagram](Appointment-scheduling---MRI Provider). -->
סקירה של נתונים, שחקנים וחילופי משאבים.

להסבר מפורט על התהליך, עיין בתיאורים [אחרי התרשים](#appointment-scheduling---mri-provider).

<div dir="ltr">{% include workflow-with-moh.svg %}</div>
<br clear="all"/>

# Technical details

## Appointment scheduling - MRI Provider
<!-- The patient will first go to the doctor (private or HMO), have a consultation and receive a referral. With a referral obtained, the next step would be to schedule an appointment with an MRI provider. Once the appointment has successfully concluded, the MRI provider shall send patient demographic and appointment details to the MoH using MRIPatient and MRIAppointment.

Two separate examples of patients are included, and three examples of an appointment being scheduled: the first appointment was cancelled, the second one was postponed, and the third one completed successfully. All three appointments are related, with the next appointment referencing the previous one. -->

המטופל יפנה תחילה לרופא (פרטי או קופת חולים), יערך ייעוץ ויקבל הפניה. עם קבלת הפניה, השלב הבא יהיה לקבוע פגישה עם ספק MRI. לאחר שהפגישה תסתיים בהצלחה, ספק ה-MRI ישלח את הפרטים הדמוגרפיים והתורים של המטופל למשרד הבריאות באמצעות [MRIPatient] ו-[MRIAppointment].

כלולות שתי דוגמאות נפרדות של מטופלים ושלוש דוגמאות לקביעת תור: התור הראשון בוטל, השני נדחה והשלישי הושלם בהצלחה. כל שלושת המינויים קשורים, כאשר הפגישה הבאה מתייחסת לקודמתה.

### Minimal patient example
**Request URL**

POST [base]/Patient

**Request body**

<!-- Example of a Patient resource with the minimal information necessary: -->
דוגמה למשאב מטופל עם המידע המינימלי הדרוש: [minimal-patient]

### More complete patient example
**Request URL**

POST [base]/Patient

**Request body**

<!-- Another example of a Patient resource with optional information included: -->
דוגמה נוספת למשאב מטופל עם מידע אופציונלי כללה: [patient-with-israeli-id]


### Cancelled appointment example
**Request URL**

POST [base]/Appointment

**Request body**

דוגמה למשאב מינימלי לפגישת MRI מבוטלת (1/3 מהסדרה): [cancelled-appointment]

המטופל ביקש תאריכי תור פנויים ב-2020-01-25 08:42, וקיבל אותם ב-2020-01-25 15:37, שהיו:

1. 2020-01-29 08:45 (נבחר על ידי המטופל)
2. 2020-01-29 10:00

בתאריך 2020-01-28 07:24:43, המטופל ביטל את הפגישה כי נאלץ להביא את ילדיו לבית הספר באופן בלתי צפוי.

### Postponed appointment example
**Request URL**

POST [base]/Appointment

**Request body**

דוגמה למשאב מינימלי לפגישת MRI נדחה (2/3 מהסדרה): [postponed-appointment]

המטופל ביקש תאריכי תור פנויים ב-2020-02-05 10:00, וקיבל אותם ב-2020-02-05 12:39, שהם:

1. 2020-02-11 16:00 (נבחר על ידי המטופל)
2. 2020-02-13 09:30

ביום 2020-02-10 13:28, המטופל דחה את התור.

### Successful appointment example
**Request URL**

POST [base]/Appointment

**Request body**

דוגמה למשאב מינימלי של מינוי MRI (3/3 מהסדרה). שני המינויים הקודמים נדחו או בוטלו: [successful-appointment]
  
המטופל ביקש תאריכי תור פנויים ב-2020-02-10 13:28:17, וקיבל אותם ב-2020-02-10 20:12:42+02:00, שהיו:

1. 28-11-2022 13:15
2. 2022-11-28 16:00 (נבחר על ידי המטופל)
3. 29-11-2022 10:00

המינוי נמשך מ-28-11-2022 בין השעות 16:00-16:45.

## Form 17 - HMO

## Procedure report - HMO

## Procedure report - MRI Provider
<!-- Once the procedure has been completed, the MRI provider needs to send the form 17 and procedure details to the MoH using MRIClaim, MRIClaimResponse, MRIProcedure, and MRIDiagnosticReport. -->
לאחר השלמת ההליך, ספק ה-MRI צריך לשלוח את טופס 17 ואת פרטי ההליך למשרד הבריאות באמצעות [MRIClaim], [MRIClaimResponse], [MRIProcedure] ו-[MRIDiagnosticReport].

### Form 17 request example
**Request URL**

POST [base]/Claim

**Request body**

דוגמה למשאב תביעה מינימלית התואם לצרכי מדידת MRI: [minimal-claim]

### Form 17 successful response example
**Request URL**

POST [base]/ClaimResponse

**Request body**

דוגמה למשאב תגובת תביעה מינימלית שהצליח: [minimal-claimresponse]

### Form 17 rejected response example
**Request URL**

POST [base]/ClaimResponse

**Request body**

דוגמה למשאב תגובת תביעה מינימלית שנדחה: [rejected-claimresponse]

</div>

{% include markdown-link-references.md %}
