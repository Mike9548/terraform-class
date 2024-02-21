output "private_ip" {
description = "Descibe the public IP of the VM"
  value = azurerm_network_interface.ogunsnic.private_ip_address
}