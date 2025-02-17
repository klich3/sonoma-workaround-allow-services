#!/bin/zsh


# █▀ █▄█ █▀▀ █░█ █▀▀ █░█
# ▄█ ░█░ █▄▄ █▀█ ██▄ ▀▄▀
#
# Author: <Anton Sychev> (anton at sychev dot xyz)
# allow_services.sh (c) 2025
# Created:  2025-02-17 23:55:20 
# Desc: description
# Docs: 
#   Just run: sudo ./allow_services.sh "<name_of_app>" "<service_name>"


echo 'usage: $ sudo ./allow_services.sh "<name_of_app>" "<service_name>"'

FILE_WORK=TCC.db
WORK_PATH=$HOME/Library/Application\ Support/com.apple.TCC/

echo "Backup tcc.db"
#back up tcc.db with auto increment
sudo cp $WORK_PATH$FILE_WORK $WORK_PATH$FILE_WORK.$(date +%Y%m%d%H%M%S).backup

SERVICES_LIST=(
    "kTCCServiceAccessibility"
    "kTCCServiceAddressBook"
    "kTCCServiceAppleEvents"
    "kTCCServiceCalendar"
    "kTCCServiceCamera"
    "kTCCServiceContactsFull"
    "kTCCServiceContactsLimited"
    "kTCCServiceDeveloperTool"
    "kTCCServiceFacebook"
    "kTCCServiceLinkedIn"
    "kTCCServiceListenEvent"
    "kTCCServiceLiverpool"
    "kTCCServiceLocation"
    "kTCCServiceMediaLibrary"
    "kTCCServiceMicrophone"
    "kTCCServiceMotion"
    "kTCCServicePhotos"
    "kTCCServicePhotosAdd"
    "kTCCServicePostEvent"
    "kTCCServiceReminders"
    "kTCCServiceScreenCapture"
    "kTCCServiceShareKit"
    "kTCCServiceSinaWeibo"
    "kTCCServiceSiri"
    "kTCCServiceSpeechRecognition"
    "kTCCServiceSystemPolicyAllFiles"
    "kTCCServiceSystemPolicyDesktopFolder"
    "kTCCServiceSystemPolicyDeveloperFiles"
    "kTCCServiceSystemPolicyDocumentsFolder"
    "kTCCServiceSystemPolicyDownloadsFolder"
    "kTCCServiceSystemPolicyNetworkVolumes"
    "kTCCServiceSystemPolicyRemovableVolumes"
    "kTCCServiceSystemPolicySysAdminFiles"
    "kTCCServiceTencentWeibo"
    "kTCCServiceTwitter"
    "kTCCServiceUbiquity"
    "kTCCServiceWillow"
)

# Función para mapear el nombre del servicio al valor correspondiente en SERVICES_LIST
function get_service_value() {
    local service_name=$1
    case $service_name in
        "camera")
            echo "kTCCServiceCamera"
            ;;
        "microphone")
            echo "kTCCServiceMicrophone"
            ;;
        "address_book")
            echo "kTCCServiceAddressBook"
            ;;
        "apple_events")
            echo "kTCCServiceAppleEvents"
            ;;
        "calendar")
            echo "kTCCServiceCalendar"
            ;;
        "contacts_full")
            echo "kTCCServiceContactsFull"
            ;;
        "contacts_limited")
            echo "kTCCServiceContactsLimited"
            ;;
        "developer_tool")
            echo "kTCCServiceDeveloperTool"
            ;;
        "facebook")
            echo "kTCCServiceFacebook"
            ;;
        "linkedin")
            echo "kTCCServiceLinkedIn"
            ;;
        "listen_event")
            echo "kTCCServiceListenEvent"
            ;;
        "liverpool")
            echo "kTCCServiceLiverpool"
            ;;
        "location")
            echo "kTCCServiceLocation"
            ;;
        "media_library")
            echo "kTCCServiceMediaLibrary"
            ;;
        "motion")
            echo "kTCCServiceMotion"
            ;;
        "photos")
            echo "kTCCServicePhotos"
            ;;
        "photos_add")
            echo "kTCCServicePhotosAdd"
            ;;
        "post_event")
            echo "kTCCServicePostEvent"
            ;;
        "reminders")
            echo "kTCCServiceReminders"
            ;;
        "screen_capture")
            echo "kTCCServiceScreenCapture"
            ;;
        "share_kit")
            echo "kTCCServiceShareKit"
            ;;
        "sina_weibo")
            echo "kTCCServiceSinaWeibo"
            ;;
        "siri")
            echo "kTCCServiceSiri"
            ;;
        "speech_recognition")
            echo "kTCCServiceSpeechRecognition"
            ;;
        "system_policy_all_files")
            echo "kTCCServiceSystemPolicyAllFiles"
            ;;
        "system_policy_desktop_folder")
            echo "kTCCServiceSystemPolicyDesktopFolder"
            ;;
        "system_policy_developer_files")
            echo "kTCCServiceSystemPolicyDeveloperFiles"
            ;;
        "system_policy_documents_folder")
            echo "kTCCServiceSystemPolicyDocumentsFolder"
            ;;
        "system_policy_downloads_folder")
            echo "kTCCServiceSystemPolicyDownloadsFolder"
            ;;
        "system_policy_network_volumes")
            echo "kTCCServiceSystemPolicyNetworkVolumes"
            ;;
        "system_policy_removable_volumes")
            echo "kTCCServiceSystemPolicyRemovableVolumes"
            ;;
        "system_policy_sysadmin_files")
            echo "kTCCServiceSystemPolicySysAdminFiles"
            ;;
        "tencent_weibo")
            echo "kTCCServiceTencentWeibo"
            ;;
        "twitter")
            echo "kTCCServiceTwitter"
            ;;
        "ubiquity")
            echo "kTCCServiceUbiquity"
            ;;
        "willow")
            echo "kTCCServiceWillow"
            ;;
        *)
            echo "Servicio no encontrado"
            ;;
    esac
}

GET_BUNDLE_ID=$(osascript -e "id of app \"$1\"")

echo "Bundle ID: $GET_BUNDLE_ID"

SERVICE_VALUE=$(get_service_value "$2")
echo "Service Value: $SERVICE_VALUE"


#add to tcc.db
sudo sqlite3 $WORK_PATH$FILE_WORK "INSERT or REPLACE INTO access (service, client, client_type, auth_value, auth_reason, auth_version, csreq, policy_id, indirect_object_identifier_type, indirect_object_identifier, indirect_object_code_identity, flags, last_modified, pid, pid_version, boot_uuid, last_reminded) \
    VALUES \
    ('$SERVICE_VALUE', '$GET_BUNDLE_ID', 0, 2, 2, 1, NULL, NULL, NULL, 'UNUSED', NULL, 0, 1669648527, NULL, NULL, 'UNUSED', 1739804049);"

echo "Done"