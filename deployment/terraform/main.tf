provider "azurerm" {
  use_oidc = true
  features {}
}


terraform {
  backend "azurerm" {
    resource_group_name = "rg-tfstate-deneme"
    storage_account_name = "satfstatedeneme13827"
    container_name = "sc-tfstate"
    key = "terraform.tfstate"
    use_oidc = true
    subscription_id = "5c5b3dfd-de8e-4027-a8b5-0c7dc3a59f99"
    tenant_id = "44316954-dbc4-4cae-a989-4d42f2891453"
  }
}


resource "azurerm_resource_group" "testing_resource_group" {
  name     = "testing-rg3"
  location = "East US"
}


resource "azurerm_virtual_network" "testing_resource" {
  name                = "testing-network3"
  location            = azurerm_resource_group.testing_resource_group.location
  resource_group_name = azurerm_resource_group.testing_resource_group.name
  address_space       = ["10.0.0.0/16"]
}
