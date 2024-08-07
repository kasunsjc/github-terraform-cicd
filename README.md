# GitHub CI/CD

## Azure Account List
az account list
Observation:
1. Make a note of the value whose key is "id" which is nothing but your "subscription_id"

## Set Subscription ID
az account set --subscription="SUBSCRIPTION_ID"

## Create Service Principal & Client Secret
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/SUBSCRIPTION_ID"

## Sample Output

```json
{
  "clientId": "e578d5de-995f-xxxx-xxxx-c412cdf35c47",
  "clientSecret": "nSi8Qtjerotjeortjepoep3I6mRcc9",
  "subscriptionId": "43b3f2ee-xxxx-xxxx-b907-0fd7ce508380",
  "tenantId": "93a4b9f8-9f40-xxxx-xxxx-83b6a36e591e",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

You need to copy the output values to a safe place. You will need them later.

## Authenticate GitHub Actions with Azure

### Create GitHub Secrets

1. Go to your GitHub repository
2. Click on "Settings" tab
3. Click on "Secrets" on the left side
4. Click on "New repository secret"
5. Add a secret with the name "AZURE_CREDENTIALS" and value as below

```json
{
  "clientId": "e578d5de-995f-xxxx-xxxx-c412cdf35c47",
  "clientSecret": "nSi8Qtjerotjeortjepoep3I6mRcc9",
  "subscriptionId": "43b3f2ee-xxxx-xxxx-b907-0fd7ce508380",
  "tenantId": "93a4b9f8-9f40-xxxx-xxxx-83b6a36e591e",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```


## Setup Azure Backend

### Create a Storage Account

```bash
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
```