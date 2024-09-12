<# 


RUNNING THIS SCRIPT

This file is designed to be run in its entirety. For instruction of how to run please see the file named 'HOW-TO-RUN-POWERSHELL-SCRIPTS.MD' 
or refer to the README.md in this repo  

#>


# Capture the IP address created above by filtering using the name $ipAddressName in the variable $ipAddress

$ipInfo = gcloud compute addresses list --filter="name=( 'NAME' $ipAddressName )";
($ipInfo[1] -match '\b\d{1,3}(\.\d{1,3}){3}\b'); 
$env:AUTOGEN_PUBLIC_IP_ADDRESS = $matches[0];
Write-Output "Public IP address created : " + $env:AUTOGEN_PUBLIC_IP_ADDRESS;

## Assocaite the new Public IP address to the new server

gcloud compute instances add-access-config $env:OPT_MS_SQL_SERVER_NAME `
--project=$env:REQ_PROJECT_ID --zone=$env:OPT_SEVER_AND_IP_ZONE --address=$env:AUTOGEN_PUBLIC_IP_ADDRESS
