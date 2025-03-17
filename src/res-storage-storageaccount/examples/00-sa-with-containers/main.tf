// Deploy storage account and 2 containers

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.25.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "storage_account" {
  source = "git::https://github.com/mikerodionov/avm-customized-modules.git//src/res-storage-storageaccount?ref=storage-account-module"

  account_replication_type      = "LRS"
  account_tier                  = "Standard"
  account_kind                  = "StorageV2"
  location                      = var.location
  name                          = "testsa20250318"
  https_traffic_only_enabled    = true
  resource_group_name           = var.resource_group_name
  min_tls_version               = "TLS1_2"
  shared_access_key_enabled     = true
  public_network_access_enabled = false
  tags                          = {}
  blob_properties               = {}

  containers = {
    blob_container0 = {
      name = "blob-container-0"
      #public_access = "container"
    }
    blob_container1 = {
      name = "blob-container-1"
      #public_access = "None"
    }
  }
}
