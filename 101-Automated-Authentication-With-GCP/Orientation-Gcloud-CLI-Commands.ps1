<# Orientation-Gcloud-CLI-Commands

This file contains commands to interact with and return data from your GCP account

The commands below can be run a number of ways

1 - Writing (or copy and pasting) them in the PowerShell (or potentially other, bash etc) terminal and pressing Enter/Return. 

2 - Selecting/highlighting the commands individually and right clicking and selecting 'run selection' 

3 - Selecting/highlighting the commands individually and clicking on the 'Run Selection...' icon typically found near the top right of the Codespace page    

# OPENING A TERMINAL

If a terminal is not already open, one can be opened via the 'Hamburger' icon typically at the top left of the Codespaces page.

Alternatively, it can be opened via the file 'Explorer'.

The 'Explorer' icon is typically the first icon below the 'Hamburger' icon. Ensure this is selected 
then right click on the name of a file in the File Explorer and select 'Open in Intergrated Terminal'.

NB:  To exit a command in PowerShell press 'CTRL' & 'C' together
#>

# Confirm that gcloud has installed correctly by getting the version installed using the command below

gcloud version


# Check you are logged in GCP with permissions to view the current project

y

# List enabled APIs on your Project

gcloud services list --enabled --project $env:CS_101_PROJECT_ID


# If you are not logged in check that you have added the Codespace CS_101_PROJECT_ID Secret correctly.
# If the Codespace Secret has been declared correctly its value should be returned with this command

$env:CS_101_PROJECT_ID


# Check that you have added the Codespace Secret CS_101_SERVICE_ACCOUNT_EMAIL_ADDRESS correctly

$env:CS_101_SERVICE_ACCOUNT_EMAIL_ADDRESS


# Check that you have added the Codespace Secret CS_101_SERVICE_ACCOUNT_JSON_SECRET correctly
# This is a big one. It starts with a '{' and ends with '}' and will contain lots of info including 
# "type", "project_id"...lots more stuff and end... "universe_domain".....

$env:CS_101_SERVICE_ACCOUNT_JSON_SECRET


# To see all environmental variable available env

env


# List server instances (In the current project I assume)

gcloud compute instances list


# Get Help with Help

gcloud help help


# List all the possible api services etc available in the account (Its a v long list)

gcloud services list --available


# Working - List Firewall rules
#see - https://cloud.google.com/sdk/gcloud/reference/compute/firewall-rules

gcloud compute firewall-rules list

# List enabled APIs on your Project

gcloud services list --enabled --project $env:CS_101_PROJECT_ID
