<# Orientation-SSHPASS-CLI-Commands

Installing sshpass has been included as part of the GitHub Codespace Instantiation process but is not required until 301 level scripts are run 

<# GETTING ORIENTATED WITH GCP VIA GCLOUD

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




# The env command below provides an extensive list of system variables ranging from the OS to Codespace secrets

env 



# To assign todays date and time to 3 thousands of a second to a new variable as a string

$dt= (Get-Date).ToString('yyyy-MM-dd-HH:mm:ss.fff')
Write-Output $dt


# To delete the variable i

Remove-Variable env:EDS_TEST_SECRET

# Below is a list of some Codespace/OS predefined variables

$PSHOME
$IsCoreCLR                      
$IsLinux                       
$IsMacOS                        
$IsWindows                     
$IsWindows10            

# To list all Codespace/OS predefined variables use 

Get-Variable
