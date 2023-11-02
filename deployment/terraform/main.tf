provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "testing_resource_group" {
  name     = "testing-rg2"
  location = "East US"
}


resource "azurerm_virtual_network" "testing_resource" {
  name                = "testing-network2"
  location            = azurerm_resource_group.testing_resource_group.location
  resource_group_name = azurerm_resource_group.testing_resource_group.name
  address_space       = ["10.0.0.0/16"]
}
