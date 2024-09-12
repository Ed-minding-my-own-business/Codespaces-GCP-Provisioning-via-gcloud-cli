<# 


RUNNING THIS SCRIPT

This file is designed to be run in its entirety. For instruction of how to run please see the file named 'HOW-TO-RUN-POWERSHELL-SCRIPTS.MD' 
or refer to the README.md in this repo  

#>

#Required - Worked (I think) - create a firewall rule to allow access to SQL Server on your VM. The default SQL Server port is 1433.
gcloud compute firewall-rules create sql-server-1433 --description "Allow SQL Server access from all sources on port 1433." --allow tcp:1433 --network default