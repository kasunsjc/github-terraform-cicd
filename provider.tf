# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 3.0" 
    }
    random = {
      source = "hashicorp/random"
      version = ">= 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name   = "rg-tf-datastore"
    storage_account_name  = "tfdatastore324"
    container_name        = "tfstate"
    key                   = "terraform.tfstate"
  }

}

# Provider Block
provider "azurerm" {
 features {}          
}

# Random String Resource
resource "random_string" "random" {
  length = 6
  upper = false 
  special = false
  numeric = true  
}


