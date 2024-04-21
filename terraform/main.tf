terraform {
  required_version = ">= 3.0.0"
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
 
#Create Resource Group
resource "azurerm_resource_group" "tamops" {
  name     = "github-sarat-example"
  location = "eastus"
}