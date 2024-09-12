<# 201-05-Register-A-Public-IP-Address


RUNNING THIS SCRIPT

This file is designed to be run in its entirety. For instruction of how to run please see the file named 'HOW-TO-RUN-POWERSHELL-SCRIPTS.MD' 
or refer to the README.md in this repo  

#>

#Setup and configure the IP address to be associated with the server created in the previous steps

## Create a new Public IP address called $CS_201_PUBLIC_IP_ADDRESS_NAME

gcloud compute addresses create $env:CS_201_PUBLIC_IP_ADDRESS_NAME `
--project=$env:CS_101_PROJECT_ID`
--description=$env:CS_201_PUBLIC_IP_ADDRESS_NAME `
--region=$env:CS_201_SERVER_AND_IP_ZONE

