terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.77.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "straccttf001"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  alias                      = "cloud"
  client_id                  = "cb546c13-bc90-4ba2-80ff-27e97f14cf7d"
  client_secret              = "BgZ8Q~rIXSmwh.oX3VSmEsV3EvkNLO_xjAqHSdrH"
  tenant_id                  = "11dbbfe2-89b8-4549-be10-cec364e59551"
  subscription_id            = "fe880dd5-3ebe-4c1b-bb39-7a80be9d40bc"
}