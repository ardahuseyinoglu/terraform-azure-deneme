provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "testing_resource_group" {
  name     = "testing-rg"
  location = "East US"
}


resource "azurerm_virtual_network" "testing_resource" {
  name                = "testing-network"
  location            = azurerm_resource_group.testing_resource_group.location
  resource_group_name = azurerm_resource_group.testing_resource_group.name
  address_space       = ["10.0.0.0/16"]
}
