resource "azurerm_resource_group" "azvmrg" {
  name     = "azvm-rg"
  location = "east us"
}

resource "azurerm_network_interface" "appvm1nic" {
  name                = "appvm1nic"
  location            = azurerm_resource_group.azvmrg.location
  resource_group_name = azurerm_resource_group.azvmrg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm-snet.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_windows_virtual_machine" "appvm1nic" {
  name                = "appvm1"
  resource_group_name = azurerm_resource_group.azvmrg.name
  location            = azurerm_resource_group.azvmrg.location
  size                = "Standard_B2s"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.appvm1nic.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}