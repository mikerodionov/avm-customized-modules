terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.25.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

module "load_balancer" {
  source              = "github.com/mikerodionov/avm-customized-modules//src/res-network-loadbalancer?ref=load-balancer-module"

  name                = "my-nlb"
  location            = "Spain Central"
  resource_group_name = "test-rg"
  sku                 = "Standard"
  sku_tier            = "Regional"

  frontend_ip_configurations = {
    frontend-ip = {
      name                          = "frontend-ip"
      create_public_ip_address      = true
      public_ip_address_resource_id = null
    }
  }

  backend_address_pools = {
    "backend-pool" = {
      name = "backend-pool"
    }
  }

  lb_rules          = {}
  lb_nat_rules      = {}
  lb_outbound_rules = {}
  lb_nat_pools      = {}
}
