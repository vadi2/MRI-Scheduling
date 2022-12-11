CodeSystem: MRIConfirmationCodeSystem
Id: mri-confirmation
Title: "MRI confirmation status"
Description: "סטטוס אישור MRI על ידי קופת החולים. ניתן להכליל לפרוצדורות אחרות לפי בקשה"
* ^caseSensitive = true
* ^experimental = false

* #undecided "טרם התקבלה החלטה"
* #approved "הבקשה אושרה"
* #rejected "הבקשה נדחתה"

ValueSet: MRIConfirmationVS
Id: MRIConfirmationVS
Title: "MRI approval status by the HMO"
Description: "סטטוס אישור MRI על ידי קופת החולים. ניתן להכליל לפרוצדורות אחרות לפי בקשה"
* ^experimental = false
* include codes from system MRIConfirmationCodeSystem
