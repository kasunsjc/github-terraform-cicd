#!/bin/bash

# Usage: ./create-sa-backend-datastore.sh <ResourceGroup> <Location> <StorageAccountName> <ContainerName>
# Example: ./create-sa-backend-datastore.sh rg-tf-datastore southeastasia tfdatastore324 tfstate

ResourceGroup=$1
Location=$2
StorageAccountName=$3
ContainerName=$4

# Login to Azure

az login

# Create a resource group
if [ $(az group exists --name $ResourceGroup) == false ]; then
    echo "Creating resource group $ResourceGroup in $Location"
    az group create --name $ResourceGroup --location $Location
else
    echo "Resource group $ResourceGroup already exists"
fi

# Create a storage account

if [ $(az storage account check-name --name $StorageAccountName --query nameAvailable) == true ]; then
    echo "Creating storage account $StorageAccountName in $Location"
    az storage account create --name $StorageAccountName --resource-group $ResourceGroup --location $Location --sku Standard_LRS
else
    echo "Storage account $StorageAccountName already exists"
fi

# Create a storage container

az storage container create --name $ContainerName --account-name $StorageAccountName

