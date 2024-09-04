<# BUILD MS SQL SERVER 2022 WEB DATA EDITION

Use this script is to create a Windows VM with MSSQL on GCP

To use this script you must have created the following additional Codespace secrets

CS_201_SEVER_AND_IP_REGION
CS_201_SEVER_AND_IP_ZONE
CS_201_MS_SQL_SERVER_NAME

Plus if you would like to decide the name of your server you will also need to create an RFC1035 compliant Codespace secrets called:



If you have not created this Codespace secret it will be created for you with a unique RFC1035 compliant server name.
For RFC1035 compiance and GCP naming conventions see: https://cloud.google.com/compute/docs/naming-resources#resource-name-format 

THE STEPS IN THIS SCRIPT ARE SUMMERISED BELOW

PART 1 - Check if the a Codespace Secret called "OPT_MS_SQL_SERVER_NAME" exists. If it does use that name. If it doesn't create it with the suggested name created in step 1

PART 2 - Build the VM based on the paramaters and Goolges OS image : sql-2022-web-windows-2022-dc-v20240415
#>




# PART 1 - Check if the a Codespace Secret called "OPT_MS_SQL_SERVER_NAME" exists.

if (Test-Path env:OPT_MS_SQL_SERVER_NAME) {
    Write-Host "OPT_MS_SQL_SERVER_NAME found:" + $env:OPT_MS_SQL_SERVER_NAME;
} else {
    $env:OPT_MS_SQL_SERVER_NAME  = $SuggestedServerName;
    "OPT_MS_SQL_SERVER_NAME created with name :" + $env:OPT_MS_SQL_SERVER_NAME;
}

# PART 2 - Build the VM based on the paramaters and Goolges OS image : sql-2022-web-windows-2022-dc-v20240415

gcloud compute instances create $env:OPT_MS_SQL_SERVER_NAME `
--project=$env:REQ_PROJECT_ID `
--zone=$env:OPT_SEVER_AND_IP_ZONE `
--machine-type=n2-standard-2 `
--network-interface=stack-type=IPV4_ONLY,subnet=default,no-address `
--can-ip-forward `
--maintenance-policy=MIGRATE `
--provisioning-model=STANDARD `
--service-account=$env:REQ_SERVICE_ACCOUNT_EMAIL_ADDRESS `
--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append `
--create-disk=auto-delete=yes,boot=yes,device-name=instance-template-20240515-152823,image=projects/windows-sql-cloud/global/images/sql-2022-web-windows-2022-dc-v20240415,mode=rw,size=50,type=projects/ppu-gcp-vms-and-dbs/zones/europe-west2-c/diskTypes/pd-ssd `
--no-shielded-secure-boot `
--shielded-vtpm `
--shielded-integrity-monitoring `
--labels=goog-ec-src=vm_add-gcloud `
--reservation-affinity=any


#Setup and configure the IP address

$ipAddressName = "ip-for-" + $env:OPT_MS_SQL_SERVER_NAME;
$ipDescription = "ip for " + $env:OPT_MS_SQL_SERVER_NAME;

## Create a new Public IP address called $ipAddressName

gcloud compute addresses create $ipAddressName `
--project=$env:REQ_PROJECT_ID`
--description=$ipDescription `
--region=$env:OPT_SEVER_AND_IP_REGION

# Capture the IP address created above by filtering using the name $ipAddressName in the variable $ipAddress
$ipInfo = gcloud compute addresses list --filter="name=( 'NAME' $ipAddressName )";
($ipInfo[1] -match '\b\d{1,3}(\.\d{1,3}){3}\b'); 
$env:AUTOGEN_PUBLIC_IP_ADDRESS = $matches[0];
Write-Output "Public IP address created : " + $env:AUTOGEN_PUBLIC_IP_ADDRESS;
## Assocaite the new Public IP address to the new server

gcloud compute instances add-access-config $env:OPT_MS_SQL_SERVER_NAME `
--project=$env:REQ_PROJECT_ID --zone=$env:OPT_SEVER_AND_IP_ZONE --address=$env:AUTOGEN_PUBLIC_IP_ADDRESS



