# now i have to create a resource group
resource "azurerm_resource_group" "oguns" {
  name     = "oguns-resourcegrp"
  location = var.location
}

#Create a virtual network
resource "azurerm_virtual_network" "ogunsvnet" {
  name                = "oguns-network"
  address_space       = var.address_space
  location            = azurerm_resource_group.oguns.location
  resource_group_name = azurerm_resource_group.oguns.name
}

#Create a subnet
resource "azurerm_subnet" "ogunssnet" {
  name                 = "oguns-subnet"
  resource_group_name  = azurerm_resource_group.oguns.name
  virtual_network_name = azurerm_virtual_network.ogunsvnet.name
  address_prefixes     = var.address_prefixes
}

#create the NIC
resource "azurerm_network_interface" "ogunsnic" {
  name                = "ogunsnet-nic"
  location            = azurerm_resource_group.oguns.location
  resource_group_name = azurerm_resource_group.oguns.name
  ip_configuration {
    name                          = "oguns-subnet"
    subnet_id                     = azurerm_subnet.ogunssnet.id
    private_ip_address_allocation = "Dynamic"
  }
}
# create a virtual machine
resource "azurerm_windows_virtual_machine" "ogunsvm" {
  name                  = "oguns-vm"
  location              = azurerm_resource_group.oguns.location
  resource_group_name   = azurerm_resource_group.oguns.name
  size                  = "Standard_F2"
  admin_username        = "ogunsad"
  admin_password        = "Ogunspass@123"
  network_interface_ids = [azurerm_network_interface.ogunsnic.id, ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}
