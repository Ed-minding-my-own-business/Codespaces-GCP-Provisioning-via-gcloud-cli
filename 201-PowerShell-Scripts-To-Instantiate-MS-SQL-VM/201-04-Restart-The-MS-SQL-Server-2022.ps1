<# 


RUNNING THIS SCRIPT

This file is designed to be run in its entirety. For instruction of how to run please see the file named 'HOW-TO-RUN-POWERSHELL-SCRIPTS.MD' 
or refer to the README.md in this repo  

#>
#Run the code below to START the server

gcloud compute instances start $env:CS_201_MS_SQL_SERVER_NAME --project=$env:CS_101_PROJECT_ID --zone=$env:CS_201_SEVER_AND_IP_ZONE