Author: Ed Fraser circa June 2024
Accompanying Youtube video ******************************************************************************************

<br>

## Intro 🤖 

<br>

**This repo programmatically authenticates to a Google Cloud Platform (GCP) account when deployed as a Codespace. Authentication 
is achieved through the use of Codespace Secrets. Example scripts are provided to provision and deploy servers via the Codespace 
terminal and PowerShell**

<br>

> **🤷‍♂️ Why use a Codespace to provision GCP?**

<br>

> **Codespaces can be deployed from almost any internet connected smart device or computer. Codespaces also offer
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

# 101-Automated-Authentication-with-GCP

This folder contains scripts which automatically run on deployment and authenticate with GCP. Other scripts in this file can be run 
manually to interact with GCP and other services.

<br>

> [!NOTE]
> Authentication is achieved via credentials you add as Codespace Secrets to your Fork/Clone of this repo. These are discussed below under **Pre-requisites > Secondly: Codespace Secrets - Level 101**

<br>

## Codespace Instantiation

When this repo is instantiated as a Codespace the first two files in the  **101-Automated-Authentication-with-GCP** folder are executed.

+ **001-Auto-GCP-Authentication.ps1** - PowerShell script to authenticate to your GCP account.
+ **002-Auto-Install-SSHPASS.ps1** - Installs 'SSHPASS' for level **301-Scripts-To-Configure-MS-SQL-VM**


## Pre-requisites

There are two steps that you need to have taken before you can build a Codespace that automatically authenticates with Google Cloud Platform.

### Firstly: Create A GCP Account, Project & Service Account

If you haven't already done so you will need to create and configure the following:

- A Google Cloud Platform (GCP) account: https://cloud.google.com

- Create a project and record the **Project ID** 
  
- Enable 'Service Usage' API on the project

- Create a Service Account and record its **Service Account Email Address**

- Grant this Service Account the 'Editor' role 

- Generate a **JSON Api Key** for this Service Account and record it

For help setting up a GCP account please see this section of my accompanying Youtube video 
******************************************************************************************

<br>


### Secondly: Add Level 101 Codespace Secrets 

You will need to add three Codespace Secrets to authenticate with GCP. These should be called:

<br>
 
`CS_101_PROJECT_ID`                         

`CS_101_SERVICE_ACCOUNT_EMAIL_ADDRESS`       

`CS_101_SERVICE_ACCOUNT_JSON_SECRET`        

<br>

Use these for the **Project ID**, the **Service Account Email Address** and the **JSON Api Key** respectively

<br>

> [!TIP] 
> The **Project ID** cannot be changed and is lower case letters and numbers with hyphens but not spaces. 

<br>

> [!TIP]
> The **JSON Api Key** is a large block of text. Including the '{' and '}' and everything in between.

<br>

To see how to add Codespace Secrets to a GitHub repo please see this section of my accompanying Youtube video:

******************************************************************************************

<br>


## Time to Instantiate your Codespace ⏱️ 

<br>

Once the Codespace Secrets have been added it is time to deploy the repo as a Codespace. This will typically take 3 to 4 minutes. The last action in the deployment process will create a file with the Codespace server's date and time called Git-Ignore-TimeInitiated.txt . Once this has been created you can interact with the Codespace. If you require help deploying the Codespace please see this section of my accompanying Youtube video.

******************************************************************************************

## Orientation & Familiarisation

In the **101-Automated-Authentication-With-GCP** folder you will also find files starting with **101-Orientation** followed by the name of 
the console applications they relate to. These scripts are designed to help you familiarise yourself with these services. The files 
contain code snippets you can run manually via the command line interface. 

<br>

## Saving Changes To Git And GitHub

If you add your own commands to the **101-Orientation** files (or any other folders in the repo) and would like these reflected in your fork/clone of this repo then you can interact with git and GitHub just as you would if you were working locally. Better yet your .git file is pre initiated ready for you to run CLI console commands like 'git add -A' and 'git commit -m"..."' in the PowerShell Terminal.

Furthermore, GitHub is pre configured so you can 'git push' when you are ready to upload your changes to GitHub. 

However, please note that files starting with 'Git Ignore' will not not be added. Please review the '.gitignore' file for details.

<br>

# 201-PowerShell-Scripts-To-Instantiate-MS-SQL-VM

<br>

## Intro

In this folder you will find a set of PowerShell script files to **Provision, Instantiate and run, Stop and Restart a VM. Reserve a public ip address and associate it to the vm and update necessary firewall settings** 

## Running PowerShell Scripts

All the PowerShell Scripts in **201-PowerShell-Scripts-To-Instantiate-MS-SQL-VM** are designed to be run in their entirety. If you would like to know how to do this, please read the file called [HOW-TO-RUN-POWERSHELL-SCRIPTS.md](HOW-TO-RUN-POWERSHELL-SCRIPTS.MD)


## Codespace Secrets - Level 201

You will need to add another four Codespace Secrets to run all the scripts in this folder. These must have the following names:

<br>

`CS_201_SERVER_AND_IP_ZONE`

`CS_201_SERVER_AND_IP_REGION`

`CS_201_MS_SQL_SERVER_NAME`

`CS_201_PUBLIC_IP_ADDRESS_NAME`

***Zone***

Before you are able to deploy a VM you will need to decide which Data Center you want it deployed in. This is determined by the 'Zone' you select. 

Once you have decided the Zone you will need to add it as a Codespace Secret called `CS_201_SEVER_AND_IP_ZONE`. 

To list Compute Engine Zones you can use this command in the Codespace PowerShell CLI:

`gcloud compute zones list`

***Region***

If you intend to add a public IP address you will need to allocate it to a 'Region'. Once you have decided the Region you will need to add it as a Codespace Secret called `CS_201_SERVER_AND_IP_REGION`.

To list Compute Engine Regions you can use this command in the Codespace PowerShell CLI:

`gcloud compute regions list`

***Server Name & IP Address Name***

You will also need a name for your server. If you want to reserve a public IP address for this server you will need a name for the IP address you reserve too. You can create you own names (as long as they are RFC1035 compliant) or use the first script in this directory called **201-01-Suggest-A-Server-And-IP-Name.ps1**.  

As I like to keep server names and IP address names consistent, I use **201-01-Suggest-A-Server-And-IP-Name.ps1** to create them. The names generated are then added to the last line in the two files listed below 

Git-Ignore-MS-SQL-Server-Names.txt
Git-Ignore-Public-IP.txt

I then add these as Codespace Secrets and reload the Codespace and browser:

`CS_201_MS-SQL-SERVER-NAME`

`CS_201_PUBLIC-IP-ADDRESS`

## Adding Secrets and Reloading The Codespace 

Codespace Secrets are added in the same way as in level **101-Automated-Authentication-With-GCP**. 
However, when Codespace Secrets are added after the Codespace has been initiated the Codespace must be reloaded (which restarts the Codespace OS and reloads the browser).

If available follow the on screen prompts. These will usually pop up in the bottom right corner of the Codespace browser page soon after a new Codespace Secret has been added to the repo on GitHub.

If the pop up does not appear, or you miss the prompt, then the Codespace can be reloaded manually. To reload the Codespace manually open the 'Command Pallet' and find and execute either '>Developer: Reload Window' or '>Codespace: Reload Window' depending which is available.

The Command Pallet can also be opened using keyboard shortcuts'Cmd' + 'P' (Mac) or 'Ctrl' + P (Windows/Linux). Or via the 'Hamburger' icon (usually found in the top left corner) > View > Command Pallet...

## Provisioning Scripts 

The Powershell provisioning scripts are listed below: 

201-01-Suggest-A-Server-And-IP-Name.ps1

201-02-Build-An-MS-SQL-Server-2022.ps1

201-03-Stop-The-MS-SQL-Server-2022.ps1

201-04-Restart-The-MS-SQL-Server-2022.ps1

201-05-Register-A-Public-IP-Address.ps1

201-06-Associate-IP-Address-To-Server.ps1

201-07-Update-Firewall-For-Public-Access.ps1

Hopefully their functions are self explanatory....

## 301-Scripts-To-Configure-MS-SQL-VM



# Apendix

### Generic link to GCP projects below:

https://console.cloud.google.com/cloud-resource-manager


https://www.youtube.com/watch?v=KeZ2ncbVPyE


