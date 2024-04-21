
resource "azurerm_virtual_network" "hub-vnet" {
  name                = "hub-vnet"
  location            = azurerm_resource_group.azvmrg.location
  resource_group_name = azurerm_resource_group.azvmrg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    environment = "Production"
  }
}


resource "azurerm_subnet" "app-snet" {
  name                 = "appsnet1"
  resource_group_name  = azurerm_resource_group.azvmrg.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_subnet" "vm-snet" {
  name                 = "vmssnet"
  resource_group_name  = azurerm_resource_group.azvmrg.name
  virtual_network_name = azurerm_virtual_network.hub-vnet.name
  address_prefixes     = ["10.0.3.0/24"]
}