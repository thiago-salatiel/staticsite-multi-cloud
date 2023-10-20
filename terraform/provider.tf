terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.21"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.77.0"
    }
  }

  backend "s3" {
    bucket         = "staticsite-multicloud-tf-v001"
    key            = "terraform.tfstate"
    dynamodb_table = "staticsite-multicloud-tf-v001"
    region         = "us-east-1"
  }

  backend "azurerm" {
    resource_group_name  = "rg-staticsite-tf"
    storage_account_name = "staticsitekbtf001"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }

}

provider "aws" {
  region = "us-east-1"
  alias  = "cloud"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
  alias                      = "cloud"
}