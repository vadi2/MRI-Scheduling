CodeSystem: MriConfirmationCodeSystem
Id: mri-confirmation
Title: "סטטוס אישור MRI"
Description: "סטטוס אישור MRI על ידי קופת החולים"
* ^caseSensitive = true
* ^experimental = false

* #undecided "טרם התקבלה החלטה"
* #approved "הבקשה אושרה"
* #rejected "הבקשה נדחתה"

ValueSet: MriConfirmationVS
Id: MriConfirmationVS
Title: "סטטוס אישור MRI על ידי קופת החולים"
Description: "קבוצת ערכים של מצבי אישור MRI אפשריים"
* ^experimental = false
* include codes from system MriConfirmationCodeSystem
