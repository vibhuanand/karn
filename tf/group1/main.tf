resource "azurerm_resource_group" "rg" {
  name     = "karn-rg-${local.environment}"
  location = local.resource_group_name
}


resource "azurerm_static_web_app" "static_web_app" {
  name                = var.resource_group_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_tier = "Free"
}
