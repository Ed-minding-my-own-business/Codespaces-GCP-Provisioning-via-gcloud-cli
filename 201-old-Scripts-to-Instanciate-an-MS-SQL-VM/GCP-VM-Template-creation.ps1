<# 
This PowerShell script uses gcloud to creates a Google Cloud Platform A VM Instance Template

This Template can then be used on in the GUI to create a VM

#>

$v = '007v'

gcloud beta compute instance-templates create inst-temp-sql-serv-2022-web-win-serv-2022-data-$v `
--project=ppu-gcp-vms-and-dbs `
--machine-type=n2-standard-2 `
--network-interface=address=34.105.171.59,network=default,network-tier=PREMIUM `
--instance-template-region=europe-west2 `
--can-ip-forward `
--maintenance-policy=MIGRATE `
--provisioning-model=STANDARD `
--service-account=926780675557-compute@developer.gserviceaccount.com `
--scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append `
--create-disk=auto-delete=yes,boot=yes,device-name=instance-template-20240515-152823,image=projects/windows-sql-cloud/global/images/sql-2022-web-windows-2022-dc-v20240415,mode=rw,size=50,type=pd-ssd `
--no-shielded-secure-boot `
--shielded-vtpm `
--shielded-integrity-monitoring `
--reservation-affinity=any