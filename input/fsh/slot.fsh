Instance: first-available-slot
InstanceOf: Slot
Usage: #example
Title: "First available slot for an appointment"
Description: "(see `start`) משבצת פנויה ראשונה לתיאום פגישה"
* schedule = Reference(minimal-schedule)
* status = #free
* start = "2022-11-28T13:15:00+02:00"
* end = "2022-11-28T15:00:00+02:00"

Instance: first-chosen-slot
InstanceOf: Slot
Usage: #example
Title: "First slot chosen for an appointment"
Description: "(see `status = busy` and `start`) משבצת ראשונה נבחרה לפגישה"
* schedule = Reference(minimal-schedule)
* status = #busy
* start = "2022-11-28T16:00:00+02:00"
* end = "2022-11-28T16:45:00+02:00"
