terraform {
  required_version = ">= 1.5.7"
  backend "azurerm" {
    resource_group_name  = "tfstate8739"
    storage_account_name = "tfstor9839"
    container_name       = "tfstatedevops"
    key                  = "tfstatedevops.tfstate"
  }
}

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "testrg" {
  name     = "github-sarat-rg"
  location = "eastus"
}