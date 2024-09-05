<# 201-01-Generate-A-Server-Name

I like to keep my server names consistant so I use this file to create a server 
name and then add it as a Codespace secret called CS_201_MS_SQL_SERVER_NAME

Suggest a unique RFC1035 compliant server name

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

# Next build the Server Name for the strings, date and 6 charactor random string

$SuggestedServerName = $serverNameStartString + "-date-" + $d + "-v-" + $v;

# Next check if the file 'Git-Ignore-Server-Names.txt' exists. If not create it
# Then iether way add the Server Name to a new line at the end of the file.

if (Test-Path ./Git-Ignore-MS-SQL-Server-Names.txt) {
    Add-Content -Path ./Git-Ignore-MS-SQL-Server-Names.txt -Value $SuggestedServerName
 
} else {
    New-Item Git-Ignore-MS-SQL-Server-Names.txt
    Set-Content Git-Ignore-MS-SQL-Server-Names.txt $SuggestedServerName
}

# Next clear the PowerShell CLI

Clear-Host

# Provide feedback in Powershell

Write-Output ""
Write-Output "The new server name suggestion is :  "
Write-Output ""
Write-Output $SuggestedServerName
Write-Output ""
Write-Output "This name has been save temporerally as the last line in 'Git-Ignore-MS-SQL-Server-Names.txt' "
Write-Output "in this project's root directory. Please add this value to a Codespace Secret called: "
Write-Output ""
Write-Output "CS_201_MS-SQL-Server-Name"
Write-Output ""
Write-Output "For instructions how to do this please refer to this projects README.MD file"
Write-Output ""
Write-Output "PLEASE NOTE:"
Write-Output "You should not need to Rebuild this Codespace to have access to new Codespace Secrets"
Write-Output "Nonetheless, for scripts to access new Codespace Secrets you will need to Reload this "
Write-Output "Codespace (which restarts the Codespace OS and reloads the browser). If available follow "
Write-Output "the on screen prompts. These will usually popup in the bottom right corner of the browser."
Write-Output ""
Write-Output "Otherwise open the 'Command Pallet' and find and execute '>Developer: Reload Window' "
Write-Output "or '>Codespace: Reload Window' depending which is available."
Write-Output ""
Write-Output "The Command Pallet can be openned using keyboard shortcuts'Cmd' + 'P' (Mac) or 'Ctrl' + P (Windows/Linux)."
Write-Output "Or via the 'Hamburger' icon (usualy found in the top left corner) > View > Command Pallet..."
