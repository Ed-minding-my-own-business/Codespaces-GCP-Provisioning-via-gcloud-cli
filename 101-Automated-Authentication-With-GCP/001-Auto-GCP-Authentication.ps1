<# 001-Auto-GCP-Authentication

This PowerShell script is started when the Codespace is built and instantiates 
and Authenticates gcloud CLI to work with Google cloud platform. 

Prerequisites:

1 - A project on GCP thats project ID is stored in the Codespace Secret you have generated called: 

    CS_101_PROJECT_ID

2 - A Service Account with the 'Editor' role thats unique email ID has been stored in the Codespace Secret you have generated called:

    CS_101_SERVICE_ACCOUNT_EMAIL_ADDRESS

3 - A Service Account JSON Secret you created and that you have stored in the Codespace Secret you have generated called:

    CS_101_SERVICE_ACCOUNT_JSON_SECRET

Please note: When you copy the JSON secret, copy and paste everything including the beginning and ending brackets '{' and '}'.
#>

# Create a file to contain the JSON Secret for GCP
New-Item file.json

# Set the contents of the file created above to the Codespaces JSON secret
Set-Content file.json $env:CS_101_SERVICE_ACCOUNT_JSON_SECRET

# Authenticate this Codespace on GCP (Google Cloud Platform)
gcloud auth activate-service-account $env:CS_101_SERVICE_ACCOUNT_EMAIL_ADDRESS --key-file=file.json --project=$env:CS_101_PROJECT_ID

# For added security remove the JSON Secret file from the Codespace
Remove-Item ./file.json

# Start the next PowerShell script to install SSHPASS. Look at this file for more details 
./101-Automated-Authentication-With-GCP/002-Auto-Install-SSHPASS.ps1
