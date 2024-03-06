
#I want to create a storage account
resource "azurerm_storage_account" "example" {
  name                     = var.storagename
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "example" {
  name                  = var.concname
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}