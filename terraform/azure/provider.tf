terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.77.0"
    }
  }
  data "terraform_remote_state" "foo" {
    backend = "azurerm"
    config = {
      storage_account_name = "terraform123abc"
      container_name       = "terraform-state"
      key                  = "prod.terraform.tfstate"
    }
  }
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  alias                      = "cloud"
}