# sonoma-workaround-allow-services


On mac sometimes the permissions for applications like Microphone or Camera for Chrome or other Apps do not appear.
With this script we can inject those permissions to appear directly in the "Privacy / System Settings".


`sudo ./allow_services.sh "<name_of_app>" "<service_name>"`

The name is the name as it appears on the application icon.

Ejemplo:

`sudo ./allow_services.sh "Safari" "Camera"`


---

## Lista de servicios

- "Accessibility"
- "AddressBook"
- "AppleEvents"
- "Calendar"
- "Camera"
- "ContactsFull"
- "ContactsLimited"
- "DeveloperTool"
- "Facebook"
- "LinkedIn"
- "ListenEvent"
- "Liverpool"
- "Location"
- "MediaLibrary"
- "Microphone"
- "Motion"
- "Photos"
- "PhotosAdd"
- "PostEvent"
- "Reminders"
- "ScreenCapture"
- "ShareKit"
- "SinaWeibo"
- "Siri"
- "SpeechRecognition"
- "SystemPolicyAllFiles"
- "SystemPolicyDesktopFolder"
- "SystemPolicyDeveloperFiles"
- "SystemPolicyDocumentsFolder"
- "SystemPolicyDownloadsFolder"
- "SystemPolicyNetworkVolumes"
- "SystemPolicyRemovableVolumes"
- "SystemPolicySysAdminFiles"
- "TencentWeibo"
- "Twitter"
- "Ubiquity"
- "Willow"
