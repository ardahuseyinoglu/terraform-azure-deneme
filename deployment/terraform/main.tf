provider "azurerm" {
  features {}
}


terraform {
  backend "azurerm" {
    resource_group_name = "rg-openai-tfstate"
    storage_account_name = "deneme251xbhs25842"
    container_name = "sc-tfstate"
    key = "terraform.tfstate"
  }
}


resource "azurerm_resource_group" "test_azure_openai_resource_group" {
  name     = "test_azure_openai_resource_group1"
  location = "East US"
}


resource "azurerm_virtual_network" "test_azure_openai_vn_resource" {
  name                = "test_azure_openai_vn_resource1"
  location            = azurerm_resource_group.test_azure_openai_resource_group.location
  resource_group_name = azurerm_resource_group.test_azure_openai_resource_group.name
  address_space       = ["10.0.0.0/16"]
}


