<# 002-Auto-Install-SSHPASS

This PowerShell script is started by the last line of: 001-Auto-GCP-Authentication and has two purposes: 

One - Installing sshpass has been included as part of the GitHub Codespace Instantiation process but is not required until 301 level scripts are run 

Two - Save the datetime the codespace finished setup in a file called Git-Ignore-Initiated.txt in the Project's root directory

#>

# One - Install sshpass 
sudo apt-get update
sudo apt-get install sshpass

# Clean up apt cache
sudo apt-get clean && rm -rf /var/lib/apt/lists/*


# Two - The following code saves the datetime the Codespace finished instanciating in a file called Git-Ignore-Initiated.txt

$CodespaceSetupCompleted = (Get-Date).ToString('yyyy-MM-dd-HH:mm:ss.fff')

# Check it Git-Ignore-Initiated.txt exists
if (Test-Path ./Git-Ignore-TimeInitiated.txt) {
    # If is does add the datetime to the last line
    Add-Content -Path ./Git-Ignore-TimeInitiated.txt -Value $CodespaceSetupCompleted
 
} else {
    # If it doesn't create it.
    New-Item ./Git-Ignore-TimeInitiated.txt
    # Now add datetime to the last line
    Set-Content ./Git-Ignore-TimeInitiated.txt $CodespaceSetupCompleted
}


