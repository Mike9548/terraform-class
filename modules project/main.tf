# this is a module block that will create a resource group
module "resourcegroup" {
  source   = "./mikerg"
  name     = "segunrg"
  location = "West US"
}

# this is to create the module for the storage account

module "storageaccount" {
  source              = "./mikestr"
  concname            = "ogunscontainer"
  storagename         = "segunstorage"
  resource_group_name = "segunrg"
  location            = "West US"
}