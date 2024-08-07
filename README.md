---
title: Terraform File Provisioner
description: Learn Terraform File Provisioner
---

## Step-00: Provisioner Concepts
- Generic Provisioners
1. [file](https://www.terraform.io/docs/language/resources/provisioners/file.html)
2. local-exec
3. remote-exec
- Provisioner Timings
  - Creation-Time Provisioners (by default)
  - Destroy-Time Provisioners  
- Provisioner Failure Behavior
  - continue
  - fail
- [Provisioner Connections](https://www.terraform.io/docs/language/resources/provisioners/connection.html)
- Provisioner Without a Resource  (Null Resource)

## Pre-requisites - SSH Keys
- Create SSH Keys for Azure VM Instance if not created
```t
# Create Folder
cd terraform-manifests/
mkdir ssh-keys

# Create SSH Key
cd ssh-ekys
ssh-keygen -m PEM -t rsa -b 4096 -C "azureuser@myserver" -f terraform-azure.pem 

# List Files
ls -lrt ssh-keys/

# Permissions for Pem file
chmod 400 terraform-azure.pem
```  
- Connection Block for provisioners uses this to connect to newly created Azure VM instance to copy files using `file provisioner`, execute scripts using `remote-exec provisioner`


## Step-1: Create Resources using Terraform commands

```t
# Terraform Initialize
terraform init

# Terraform Validate
terraform validate

# Terraform Format
terraform fmt

# Terraform Plan
terraform plan

# Terraform Apply
terraform apply -auto-approve

# Verify - Login to Azure Virtual Machine Instance
ssh -i ssh-keys/terraform-azure.pem azureuser@IP_ADDRESSS_OF_YOUR_VM
ssh -i ssh-keys/terraform-azure.pem azureuser@20.185.30.127
Verify /tmp for all files copied
cd /tmp
ls -lrta /tmp

```