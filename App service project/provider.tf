# this will configure my provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.92.0"
    }
  }
}
# configure the microsoft azure provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}
terraform {
  backend "azurerm" {
    resource_group_name  = "ogunsapp"
    storage_account_name = "ogunsstg"
    container_name       = "ogunscon"
    key                  = "test.terraform.tfstate"
  }
}
