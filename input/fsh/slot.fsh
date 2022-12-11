Profile: MRISlot
Parent: Slot
Id: mri-slot
Title: "MRI Slot"
Description: "מטרת הפרופיל היא משבצת זמן פנויה או משומשת להליך MRI, כחלק ממעקב אחר זמני רשימת ההמתנה למשרד הבריאות הישראלי."
* schedule and status and start and end MS
* extension contains MRIFirstChosenSlot named firstChosenSlot 0..1 MS
* schedule.display = "not used"


Extension: MRIFirstChosenSlot
Id: first-chosen-slot
Title: "First appointment slot that is chosen by the patient"
Description: "הרחבה: משבצת פגישה ראשונה שנבחרה על ידי המטופל מבין כל החלופות המוצעות"
* value[x] only boolean


Mapping: MRISlotToGertner
Source: MRISlot
Target: "http://www.gertnerinst.org.il"
Id: SlotMapping
Title: "מיפוי של משבצת זמן בודדת הזמינה לפגישה למודל נתוני רשימת המתנה MRI של גרטנר."
* start -> "MRI_first_available_date"
* extension[firstChosenSlot] -> "MRI_first_chosen_date"

Instance: cancelled-slot1
InstanceOf: MRISlot
Usage: #example
Title: "cancelled-slot1"
Description: "אחד משני משבצות הפגישה שנבחר תחילה על ידי המטופל כאפשרות הזמן המועדפת, אך לאחר מכן התור עצמו במועד מאוחר יותר מבוטל על ידי המטופל"
* meta.profile = Canonical(MRISlot)
* extension[+].url = Canonical(MRIFirstChosenSlot)
* extension[=].valueBoolean = true
* status = #busy
* start = "2020-01-29T08:45:00+02:00"
* end = "2020-01-29T09:30:00+02:00"
* schedule.display = "not used"

Instance: cancelled-slot2
InstanceOf: MRISlot
Usage: #example
Title: "cancelled-slot2"
Description: "אחד משני משבצות הפגישה שהיו פנויות לפגישה שבוטלה בהמשך"
* meta.profile = Canonical(MRISlot)
* status = #free
* status = #free
* start = "2020-01-29T10:00:00+02:00"
* end = "2020-01-29T10:45:00+02:00"
* schedule.display = "not used"

Instance: postponed-slot1
InstanceOf: MRISlot
Usage: #example
Title: "postponed-slot1"
Description: "אחד משני משבצות הפגישה שנבחרו בתחילה על ידי המטופל כאפשרות הזמן המועדפת, אך לאחר מכן הפגישה עצמה במועד מאוחר יותר נדחה על ידי המטופל"
* meta.profile = Canonical(MRISlot)
* extension[+].url = Canonical(MRIFirstChosenSlot)
* extension[=].valueBoolean = true
* status = #busy
* start = "2020-02-11T16:00:00+02:00"
* end = "2020-02-11T16:45:00+02:00"
* schedule.display = "not used"

Instance: postponed-slot2
InstanceOf: MRISlot
Usage: #example
Title: "postponed-slot2"
Description: "אחד משני משבצות הפגישה שהיו פנויות לפגישה שבוטלה בהמשך"
* meta.profile = Canonical(MRISlot)
* status = #free
* status = #free
* start = "2020-02-13T09:30:00+02:00"
* end = "2020-02-13T10:15:00+02:00"
* schedule.display = "not used"

Instance: first-available-slot
InstanceOf: MRISlot
Usage: #example
Title: "first-available-slot"
Description: "(see `start`) משבצת פנויה ראשונה לתיאום פגישה"
* meta.profile = Canonical(MRISlot)
* status = #free
* start = "2022-11-28T13:15:00+02:00"
* end = "2022-11-28T15:00:00+02:00"
* schedule.display = "not used"

Instance: first-chosen-slot
InstanceOf: MRISlot
Usage: #example
Title: "first-chosen-slot"
Description: "(see `status = busy` and `start`) משבצת ראשונה נבחרה לפגישה"
* meta.profile = Canonical(MRISlot)
* extension[+].url = Canonical(MRIFirstChosenSlot)
* extension[=].valueBoolean = true
* status = #busy
* start = "2022-11-28T16:00:00+02:00"
* end = "2022-11-28T16:45:00+02:00"
* schedule.display = "not used"

Instance: third-available-slot
InstanceOf: MRISlot
Usage: #example
Title: "third-available-slot"
Description: "משבצת שלישית פנויה לפגישה שלא נבחרה"
* meta.profile = Canonical(MRISlot)
* status = #free
* start = "2022-11-29T10:00:00+02:00"
* end = "2022-11-29T10:45:00+02:00"
* schedule.display = "not used"
