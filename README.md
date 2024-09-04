# Codespaces-GCP-Provisioning-via-gcloud-cli

Author: Ed Fraser circa June 2024
<br>

## Intro 🤖 

<br>

**This repo programmatically authenticates to a Google Cloud Platform (GCP) account when deployed as a Codespace and allows (and provides scripts for)
GCP provisioning via the Codespace terminal and PowerShell**

<br>

> **🤷‍♂️ Why use a Codespace to provision GCP?**

<br>

> **Codespaces allow development from almost any internet connected smart device or computer. Codespaces also offer
> a consistent dev environment and seamless integration with GitHub repositories meaning that once a script has been
> written it can be added to git in the Codespace and pushed to GitHub using familiar cli commands or VScode extensions. 
> No need for git initialisation or GitHub credentials as GitHub authorisation and the git repo are 'baked in' 🥧.**
>
> **Plus, if you feel the Codespace you have been working has 'gone to pot' 🪴, You can just delete it and build
> a new one. Happy days! 😅**

<br>

The repo is organised into levels which group different sets for functions and processes. These are:

+ **101-Automated-Authentication-With-GCP**
+ **201-PowerShell-Scripts-To-Instantiate-MS-SQL-VM**
+ **301-Scripts-To-Configure-MS-SQL-VM**

This repo contains folders with the same names as above. The purpose of the scripts in these folders are discussed below:

## 101-Automated-Authentication-with-GCP

<br>

> [!NOTE]
> Authentication is achieved via credentials you add as Codespace Secrets to your Fork/Clone of this repo. These are discussed below under **Pre-requisites > Secondly: Codespace Secrets - Level 101**

<br>

### Codespace Instantiation

When this repo is instantiated as a Codespace the first two files in the  **101-Automated-Authentication-with-GCP** are executed.

+ **001-Auto-GCP-Authentication.ps1** - Is a PowerShell script that authenticates to your Google Cloud Platform account.
+ **002-Auto-Install-SSHPASS.ps1** - Installs 'SSHPASS'. However, SSHPASS until level **301-Scripts-To-Configure-MS-SQL-VM**
    
In **101-Automated-Authentication-With-GCP** you will also find files starting with the word **Orientation** followed by the name of 
the console applications they relate to. These files contain code snippets you can run manually via the command line interface. 

<br>


### Pre-requisites

There are three steps that you need to have taken before you can build a Codespace that automatically authenticates with Google Cloud Platform.

#### Firstly: A GCP Account, Project & Service Account

If you haven't already done so you will need to create the following:

- **A Google Cloud Platform (GCP) account: https://cloud.google.com**

- **You may want to create an Organisation to help group your projects.**

- **Create a project and record the project's unique identifier**
  
- **Enable the appropriate APIs for the project**

- **Create a Service Account and record its email address**

- **Grant this Service Account the appropriate permissions**

- **Generate an api key for this Service Account**

<br>

#### Secondly: Codespace Secrets - Level 101

You will need to add three Codespace Secrets to authenticate with GCP. These should be called:

<br>
 
CS_101_PROJECT_ID                          - Must contain the **Project ID**

CS_101_SERVICE_ACCOUNT_EMAIL_ADDRESS       - Must contain the email address that identifies the **Service Account**

CS_101_SERVICE_ACCOUNT_JSON_SECRET         - Must contain the **JSON Secret** including the '{' and '}' and everything between

<br>

NB: The **Project ID** is based on the original Project Name but cannot be changed and is lower case letters with hyphens but not spaces. 

******************************************************************************************

To add the codespace secrets 

<br>

#### Lastly: GCP Permissions & Apis

One might think that if you are the owner of the account or organisational unit within the account you would automatically be 
granted all the permissions you need to do anything you wanted on the account. 
In my experience this is not the case. However you should have permission to give yourself the permissions you need to do anything
you want on the account. It's then just a question of identifying which roles you need to grant yourself 
to get these permissions.

As of August 2024 according to [Permissions](https://gcp.permissions.cloud/), GCP has 10,174 known IAM actions and 1,674
Predefined Roles. As daunting as this may sound, adding the correct roles (groups of permissions/available AIM actions) 
is helped immeasurably by the feedback you get if you are willing to try everything first on the GCP website....

Invariably, if you are unable to do something it is because you do not have persisson to do it or have not yet enabled an api needed to interact 
with the service you want to use. 

Fortunately, In my experience, the feedback will usually tell you the IAM actions you require permissions for or lead you to the page to 
enable the appropriate API. Unfortunately however, it will not make sensible suggestions as to which roles you might want to grant yourself 
(or your service accounts) to enable the relevant IAM actions.

Typically I look at a list of possible Roles I can see include the Actions needed and grant myself the one that sounds like it makes the most sense. 
Alternatively, you may be able to grant yourself granular premissions for just the specific actions you and/or the Service Account require. 
I personally prefer to give myself roles that cover at least the Actons I need. We will look at roles for the Service Accounts when we set it up below.

As for the roles you need to create the service account, you should be able to grant these to yourself. Or get someone in your organisation to grant them to you.

<br>

### Time to Instantiate your Codespace ⏱️ 

<br>




<br>

## 201-PowerShell-Scripts-To-Instantiate-MS-SQL-VM

<br>

### Intro

In this folder you will find a set of script files to **Provision, Instanciate and run, Stop and Restart a VM, update firewall settings and associate a public ip address to the vm** 

201-01-Generate-A-Server-Name.ps1

201-02-Build-An-MS-SQL-server-2022.ps1

201-03-Stop-The-MS-SQL-server-2022.ps1

201-04-Restart-The-MS-SQL-server-2022.ps1

201-05-Register-A-Public-IP-Address.ps1

201-06-Associate-IP-Address-To-Server.ps1

201-07-Update-Firewall-For-Public-Access.ps1

###Codespace Secrets - Level 101

You will need to add three Codespace Secrets to authenticate with GCP. These should be called:

<br>

CS_201_SEVER_AND_IP_REGION
CS_201_SEVER_AND_IP_ZONE
CS_201_MS-SQL-Server-Name

+ **Provision and deploy a SQL server 2022 VM and databases.**	

+ **Start and Stop the VM**
	
+ **Configure public IP addresses and associate them to the VM**
	
+ **Set fire wall rules to allow public database access**
	


## 301-Scripts-To-Configure-MS-SQL-VM


+ **Configure ssh to login to VMs**
	
+ **Programatically administrate the databases**

Phase 2

+ **Build a database from a backup**

<br>
  

> [!IMPORTANT] 
> To auto authenticate the Codespace generated by your clone/fork of this repo you will need a **GCP account** with a **GCP project**,
> a **Service Account** for that project and a **Service Account api key**. You will also need to enable the nessesary APIs for that project.
> See the **[Creating a GCP Account Project & Service Account](https://github.com/edwardfraser2002/Codespaces-GCP-Provisioning-via-gcloud-cli/blob/main/README.md#creating-a-gcp-account-project--service-account)** section below.
> You and the service account you generate will also need relevant permissions. See the **[GCP Permissions](https://github.com/edwardfraser2002/Codespaces-GCP-Provisioning-via-gcloud-cli/edit/main/README.md#gcp-permissions--apis)** section below.
> You will also need to create Codespace Secrets containing the **Project Identifier**, the **Service Account name**
> and the **Service Account API key**. See the [**Codespace Secrets**](https://github.com/edwardfraser2002/Codespaces-GCP-Provisioning-via-gcloud/edit/main/README.md#codespace-secrets) section below.









### Automations run on Codespace startup

Automated processes include:

1 Authentication of the connection to GCP - GCP01-Autho.ps1

2 Installation of SSHPASS in the new Codespace - GCP02-Env-Config.ps1

## Intro to GCP and gcloud & Google CloudShell

 
>[!WARNING]
> Please note that deleting the Codespace build by this repo will not undo the changes made on GCP.
> You will need to use your GCP account to do this. 



# Apendix

### Generic link to GCP projects below:

https://console.cloud.google.com/cloud-resource-manager

### Authentication

<br>



>
Therefore: mcr.microsoft.com/devcontainers/base:bullseye

GCP and PowerShell are then added to this image in the devcontainerfile with the follow to Features.

`"features": {
		"ghcr.io/dhoeric/features/google-cloud-cli:1": {
			"version": "latest"		
		},
		//"ghcr.io/joshuanianji/devcontainer-features/gcloud-cli-persistence:1": {},
		"ghcr.io/devcontainers/features/powershell:1": {
			"version": "latest"
		}`


These Fearures enable the executions of comands on Google Cloud Platform via the Teminal CLI (in this case PowerShell) using  the gcloud command.

Some comands to help get started include:

`gcloud version`

`gcloud help help`

`gcloud projects list` 

`gcloud alpha projects search`

This youtube video was a great help getting started 

https://www.youtube.com/watch?v=KeZ2ncbVPyE





Get info on a SQL instance:
gcloud sql instances describe ppu-gcp-db-v01 --project=ppu-gcp-ms-sql-fallback-server


## PUbilc IPs
