#The following creates an ssh key of type (-t) rsa (rsa is a type public-key cryptosystem). -N "" is the paramater and value for no passphrase and -q minimises feedback from the command.
ssh-keygen -t rsa -N "" -f "/home/vscode/.ssh/id_rsa" -q


#Overwrite an SSH key (-y is the yes parameter to overwrite the existing file)
ssh-keygen -t rsa -N "" -f "/home/vscode/.ssh/id_rsa" -q -y


# For a dry run 
sshpass -p "nJ0:DHze7@}kf=V" ssh-copy-id -f -i "/home/vscode/.ssh/id_rsa" ed_fraser@34.39.19.192

# For a dry run 
sshpass -p "nJ0:DHze7@}kf=V" ssh ed_fraser@34.39.19.192


$user = "ed_fraser"
$remoteHost = "34.39.19.192"
$password = "nJ0:DHze7@}kf=V"
$pubKeyPath = "/home/vscode/.ssh/id_rsa"
$pubKey = Get-Content $pubKeyPath

# Create the SSH session
$session = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user, (ConvertTo-SecureString $password -AsPlainText -Force)

# Append the public key to the authorized_keys file on the remote host
$command = "mkdir -p ~/.ssh && echo $pubKey >> ~/.ssh/authorized_keys"
Invoke-Command -Credential $session -ComputerName $remoteHost -ScriptBlock { param($command) & $command } -ArgumentList $command




ssh ed_fraser@34.39.19.192

#Enable-PSRemoting

$p='nJ0:DHze7@}kf=V'
sshpass ed_fraser@34.39.19.192 

sshpass
ssh-copy-id
$passwd = convertto-securestring -AsPlainText -Force -String 'nJ0:DHze7@}kf=V'

$cred = new-object -typename System.Management.Automation.PSCredential 
-argumentlist "ed_fraser",$passwd

$session = new-pssession -computername 34.39.19.192 -credential $cred

ssh-copy-id ed_fraser@34.39.19.192

sshpass
sudo service ssh restart
Invoke-Command -ComputerName ppu-sql-serv-2022-web-win-serv-2022-data-20240723-005v -ScriptBlock {get-date}
pwsh
ssh ed_fraser@34.39.19.192

ping 34.39.19.192

nJ0:DHze7@}kf=V

Enter-PSSession -HostName 34.39.19.192 -UserName ed_fraser -PassWord 'nJ0:DHze7@}kf=V'

PSSession 

#To count how many cammand available use

`get-command | Measure-Object`

ssh your_username@your_vm_ip -p 2301


ssh ed_fraser@34.39.19.192


[AppDomain]::CurrentDomain.GetAssemblies().GetTypes()  | Where-Object {$_.NameSpace -eq 'System.IO'} | Measure-Object


[AppDomain]::CurrentDomain.GetAssemblies().GetTypes()  | Where-Object {$_.NameSpace -eq 'System.IO'}

[AppDomain]::CurrentDomain.GetAssemblies().GetTypes()  | Where-Object {$_.NameSpace -eq 'System.IO'} | Measure-Object

[System.AppDomain]::CurrentDomain.GetAssemblies()

[System.AppDomain]::CurrentDomain.GetAssemblies() | Measure-Object



$n=1.9404296875
[math]::round($n,6)

Test-Connection -ComputerName "34.39.19.192" -Count 4

sudo apt-get install -y iputils-ping

ping 34.39.19.192

apt-cache search ping

sudo apt-get install sshpass

gh -v
sudo apt-get update
sudo apt-get install gh

curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

$repoOwner = "your-github-username"
$repoName = "your-repo-name"
$secretName = "MY_SECRET"
$secretValue = "my_secret_value"

# Set the secret using GitHub CLI
gh secret set $secretName -b"$secretValue" --repo $repoOwner/$repoName

gcloud init

gcloud compute instances list --filter="name"

ppu-sql-serv-2022-web-win-serv-2022-data-20240723-005v

gcloud compute instances stop "ppu-sql-serv-2022-web-win-serv-2022-data-20240723-005v" --project="ppu-gcp-vms-and-dbs" --zone="europe-west2-c" 


gcloud compute instances start "ppu-sql-serv-2022-web-win-serv-2022-data-20240723-005v" --project="ppu-gcp-vms-and-dbs" --zone="europe-west2-c" 

