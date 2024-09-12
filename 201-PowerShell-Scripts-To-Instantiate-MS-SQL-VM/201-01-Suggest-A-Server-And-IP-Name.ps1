<# 201-01-Suggest-A-Server-And-IP-Name

To create a server using the next script in this folders called 201-02-Build-An-MS-SQL-Server-2022.ps1 a GCP complient 
server name is required. This server name must be stored in a Codespace Secret called CS_201_MS_SQL_SERVER_NAME.

Also, to create a Public IP address using script in this folder called 201-05-Register-A-Public-IP-Address.ps1 a GCP complient
IP address name is required. This Public IP address name must be stored in a Codespace Secrete called CS_201_Public_IP_ADDRESS_NAME.

For GCP naming conventions see: https://cloud.google.com/compute/docs/naming-resources#resource-name-format

You can add these Codespace Secret at any time, but in order for the Codespace to have access to it you will need to 
Reload the Codespace and the browser.

You can use any names you like as long as they area RFC1035 compliant.

As I like to keep server names and IP address names consistant, I use this script to create them. The names generated are then added to the last line in the two files listed below 

Git-Ignore-MS-SQL-Server-Names.txt
Git-Ignore-Public-IP.txt

I then add these as Codespace Secrets and reload the Codespace and browser:

CS_201_MS_SQL_SERVER_NAME
CS_201_PUBLIC_IP_ADDRESS_NAME

RUNNING THIS SCRIPT

This file is designed to be run in its entirety. For instruction of how to run please see the file named 'HOW-TO-RUN-POWERSHELL-SCRIPTS.MD' 
or refer to the README.md in this repo  

#>

# Declare variables for the start of the server name. 
# The begining indicates the OS of the server

$serverNameStartString = "ms-sql-serv-2022-web-data";

# Below gets the date to included in the new server's name

$d = (Get-Date).ToString('yyyyMMdd');

# Below creates a pretty random 6 letter/number string for the version to ensure 2 or
# more instances are unlikely to have exactly the same name even created on the same day

$guid = [guid]::NewGuid().ToString("N")  # Generates a GUID without hyphens
$v = $guid.Substring(0, 6)    # Take the first 6 charactors

# Next build the Server Name for the OS name, date ($d) and 6 charactor random string ($v)

$SuggestedServerName = $serverNameStartString + "-date-" + $d + "-v-" + $v;

# Next suggest an IP address name for a public IP address for this server

$SuggestedPublicIPaddressName = "public-ip-address-for-" + $SuggestedServerName;

# Next check if the file 'Git-Ignore-Server-Names.txt' exists. If not create it
# Then iether way add the Server Name to a new line at the end of the file.

if (Test-Path ./Git-Ignore-MS-SQL-Server-Names.txt) {
    Add-Content -Path ./Git-Ignore-MS-SQL-Server-Names.txt -Value $SuggestedServerName
 
} else {

    New-Item ./Git-Ignore-MS-SQL-Server-Names.txt
    Set-Content ./Git-Ignore-MS-SQL-Server-Names.txt $SuggestedServerName

}

# Next check if the file 'Git-Ignore-Public-IP.txt' exists. If not create it
# Then iether way add a Public IP Address Discription to a new line at the end of the file.

if (Test-Path ./Git-Ignore-Public-IP.txt) {

    Add-Content -Path ./Git-Ignore-Public-IP.txt -Value $SuggestedPublicIPaddressName
 
} else {

    New-Item Git-Ignore-Public-IP.txt
    Set-Content Git-Ignore-Public-IP.txt -Value $SuggestedPublicIPaddressName
}



# Next clear the PowerShell CLI

Clear-Host

# Provide feedback in Powershell

Write-Output ""
Write-Output "The new server name suggestion is :  "
Write-Output ""
Write-Output $SuggestedServerName
Write-Output ""
Write-Output "The new Public IP Address Name suggestion is :  "
Write-Output ""
Write-Output $SuggestedPublicIPaddressName
Write-Output ""
Write-Output "These two names have been save temporerally as the last line in files called"
Write-Output "'Git-Ignore-MS-SQL-Server-Names.txt' and 'Git-Ignore-Public-IP-address-name.txt' "
Write-Output "in this project's root directory. Please add these values to Codespace Secrets called: "
Write-Output ""
Write-Output "CS_201_MS_SQL_SERVER_NAME"
Write-Output "CS_201_PUBLIC_IP_ADDRESS_NAME"
Write-Output ""
Write-Output "PLEASE NOTE:"
Write-Output "For scripts to access new Codespace Secrets you will need to Reload this "
Write-Output "Codespace (which restarts the Codespace OS and reloads the browser)."
Write-Output "For instructions how to add Codespace Secrets and Reload the Codespace and browser"
Write-Output "please refer to this projects README.MD file"
