# I create my resource group
resource "azurerm_resource_group" "mikerg" {
  name     = "mycalrg"
  location = "west europe"
}
# create an app service plan
resource "azurerm_service_plan" "mikplan" {
  name                = "mycalplan"
  resource_group_name = azurerm_resource_group.mikerg.name
  location            = azurerm_resource_group.mikerg.location
  sku_name            = "P1v2"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "mikeapp" {
  name                = "mycalapps"
  resource_group_name = azurerm_resource_group.mikerg.name
  location            = azurerm_resource_group.mikerg.location
  service_plan_id     = azurerm_service_plan.mikplan.id
  site_config {}

}