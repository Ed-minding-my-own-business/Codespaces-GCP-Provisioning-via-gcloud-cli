<# 


RUNNING THIS SCRIPT

This file is designed to be run in its entirety. For instruction of how to run please see the file named 'HOW-TO-RUN-POWERSHELL-SCRIPTS.MD' 
or refer to the README.md in this repo  

#>
#Setup and configure the IP address to be associated with the server created in the previous steps

$ipAddressName = "ip-for-" + $env:OPT_MS_SQL_SERVER_NAME;
$ipDescription = "ip for " + $env:OPT_MS_SQL_SERVER_NAME;

## Create a new Public IP address called $ipAddressName

gcloud compute addresses create $ipAddressName `
--project=$env:CS_101_PROJECT_ID`
--description=$ipDescription `
--region=$env:OPT_SEVER_AND_IP_REGION


Write-Output ""
Write-Output "For instructions how to do this please refer to this projects README.MD file"
Write-Output ""
Write-Output "PLEASE NOTE:"
Write-Output "For scripts to access new Codespace Secrets you will need to Reload the "
Write-Output "Codespace (which restarts the Codespace OS and reloads the browser). If available follow "
Write-Output "the on screen prompts. These will usually popup in the bottom right corner of the browser"
Write-Output "when a new Codespace Secrets is created."
Write-Output ""
Write-Output "Otherwise open the 'Command Pallet' and find and execute '>Developer: Reload Window' "
Write-Output "or '>Codespace: Reload Window' depending which is available."
Write-Output ""
Write-Output "The Command Pallet can be openned using keyboard shortcuts'Cmd' + 'P' (Mac) or 'Ctrl' + P (Windows/Linux)."
Write-Output "Or via the 'Hamburger' icon (usualy found in the top left corner) > View > Command Pallet..."
