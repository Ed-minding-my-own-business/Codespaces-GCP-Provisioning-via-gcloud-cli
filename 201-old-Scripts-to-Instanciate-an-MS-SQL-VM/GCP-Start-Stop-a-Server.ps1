#Run the code below to START the server

gcloud compute instances start "ppu-sql-serv-2022-web-win-serv-2022-data-20240723-005v" --project="ppu-gcp-vms-and-dbs" --zone="europe-west2-c" 

#Run the code below to STOP the server
gcloud compute instances stop "ppu-sql-serv-2022-web-win-serv-2022-data-20240723-005v" --project="ppu-gcp-vms-and-dbs" --zone="europe-west2-c" 





# Run the code below to Assign the Server name Project & Zone to variables
$server = "ppu-sql-serv-2022-web-win-serv-2022-data-20240723-005v"
$project = "ppu-gcp-vms-and-dbs"
$zone = "europe-west2-c"

#Run the code below to START the Server using the above variables
gcloud compute instances start $server --project=$project --zone=$zone 

#Run the code below to STOP the Server using the above variables
gcloud compute instances stop $server --project=$project --zone=$zone