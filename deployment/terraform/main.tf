provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name   = azurerm_resource_group.testing_resource_group.name
    storage_account_name  = azurerm_storage_account.testing_storage_account_1651253.name
    container_name        = azurerm_storage_container.testing_storage_container.name
    key                   = "terraform.tfstate"
  }
}

resource "azurerm_resource_group" "testing_resource_group" {
  name     = "testing-rg"
  location = "East US"
}

resource "azurerm_storage_account" "testing_storage_account_1651253" {
  name                     = "testing-sa"
  resource_group_name      = azurerm_resource_group.testing_resource_group.name
  location                 = azurerm_resource_group.testing_resource_group.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "testing_storage_container" {
  name                  = "terraform-state"
  storage_account_name  = azurerm_storage_account.testing_storage_account_1651253.name
  container_access_type = "private"
}

resource "azurerm_virtual_network" "testing_resource" {
  name                = "testing-network"
  location            = azurerm_resource_group.testing_resource_group.location
  resource_group_name = azurerm_resource_group.testing_resource_group.name
  address_space       = ["10.0.0.0/16"]
}
