<# BUILD MS SQL SERVER 2022 WEB DATA EDITION

Use this script to create a Windows VM with MSSQL on GCP

To use this script you must have created the following additional Codespace Secrets

CS_201_SEVER_AND_IP_REGION
CS_201_SEVER_AND_IP_ZONE
CS_201_MS_SQL_SERVER_NAME

The CS_201_MS_SQL_SERVER_NAME if for the server name which you can make up yourself but according 
to the Google documentation it must be RFC1035 compliant.

For RFC1035 compiance and GCP naming conventions see: https://cloud.google.com/compute/docs/naming-resources#resource-name-format


THE STEPS IN THIS SCRIPT ARE SUMMERISED BELOW

PART 1 - Check if the relevant Codespace Secret exists. If it doesn't stop and provide feedback in the CLI console. Otherwise continue to PART 2.

PART 2 - Build the VM based on the paramaters and Goolges OS image : sql-2022-web-windows-2022-dc-v20240415

RUNNING THIS SCRIPT

This file is designed to be run in its entirety. For instruction of how to run please see the file named 'HOW-TO-RUN-POWERSHELL-SCRIPTS.MD' 
or refer to the README.md in this repo  

#>




# PART 1 - Check if the additional required Codespace Secrets exists.

if (Test-Path env:CS_201_MS_SQL_SERVER_NAME) {
    Write-Host "CS_201_MS_SQL_SERVER_NAME found with string : " + $env:CS_201_MS_SQL_SERVER_NAME;
} else {
    Write-Host "In order to create a server instance a Codespace called CS_201_MS_SQL_SERVER_NAME is required.     
    Please add a Codespace Secret called CS_201_MS_SQL_SERVER_NAME and Reload this Codespace and Browser and 
    run this script again. 
    Please refer to the README.md file for more details"
    Break;
}

if (Test-Path env:CS_201_SEVER_AND_IP_ZONE) {
    Write-Host "CS_201_SERVER_AND_IP_ZONE found with string : " + $env:CS_201_SERVER_AND_IP_ZONE;
} else {
    Write-Host "In order to create a server instance a Codespace called CS_201_SERVER_AND_IP_ZONE is required.     
    Please add a Codespace Secret called CS_201_SERVER_AND_IP_ZONE and Reload this Codespace and Browser and 
    run this script again.  
    Please refer to the README.md file for more details"
    Break;
}

if (Test-Path env:CS_201_SERVER_AND_IP_REGION) {
    Write-Host "CS_201_SERVER_AND_IP_REGION found with string : " + $env:CS_201_SERVER_AND_IP_REGION;
} else {
    Write-Host "In order to create a server instance a Codespace called CS_201_SEVER_AND_IP_REGION is required.     
    Please add a Codespace Secret called CS_201_SEVER_AND_IP_REGION and Reload this Codespace and Browser and 
    run this script again.  
    Please refer to the README.md file for more details"
    Break;
}

# PART 2 - Build the VM based on the paramaters and Goolges OS image : sql-2022-web-windows-2022-dc-v20240415

gcloud compute instances create $env:CS_201_MS_SQL_SERVER_NAME ` 
--project=$env:CS_101_PROJECT_ID `
--zone=$env:CS_201_SERVER_AND_IP_ZONE `
--machine-type=n2-standard-2 `
--network-interface=stack-type=IPV4_ONLY,subnet=default,no-address `
--can-ip-forward `
--maintenance-policy=MIGRATE `
--provisioning-model=STANDARD `
--service-account=$env:CS_101_SERVICE_ACCOUNT_EMAIL_ADDRESS `
--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append `
--create-disk=auto-delete=yes,boot=yes,device-name=instance-template-20240515-152823,image=projects/windows-sql-cloud/global/images/sql-2022-web-windows-2022-dc-v20240415,mode=rw,size=50,type=projects/ppu-gcp-vms-and-dbs/zones/europe-west2-c/diskTypes/pd-ssd `
--no-shielded-secure-boot `
--shielded-vtpm `
--shielded-integrity-monitoring `
--labels=goog-ec-src=vm_add-gcloud `
--reservation-affinity=any