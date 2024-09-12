<# 


RUNNING THIS SCRIPT

This file is designed to be run in its entirety. For instruction of how to run please see the file named 'HOW-TO-RUN-POWERSHELL-SCRIPTS.MD' 
or refer to the README.md in this repo  

#>


# Capture the IP address in $PublicIP created above by filtering using the name $env:CS_201_PUBLIC_IP_ADDRESS_NAME in the variable $ipAddress $ipInfo

$ipInfo = gcloud compute addresses list --filter="name=( 'NAME' $env:CS_201_PUBLIC_IP_ADDRESS_NAME )";
($ipInfo[1] -match '\b\d{1,3}(\.\d{1,3}){3}\b'); 
$PublicIP = $matches[0];
Write-Output "Public IP address created : " + $PublicIP

## Assocaite the new Public IP address to the new server

gcloud compute instances add-access-config $env:OPT_MS_SQL_SERVER_NAME `
--project=$env:CS_101_PROJECT_ID --zone=$env:CS_201_SERVER_AND_IP_ZONE --address=$PublicIP
