resource "azurerm_resource_group" "rg" {
  name     = "karn-rg-${var.environment}"
  location = var.location
}

resource "azurerm_resource_group" "rg-test" {
  name     = "karn-rg-${var.environment}-test"
  location = var.location
}


resource "azurerm_static_web_app" "static_web_app" {
  name                = var.resource_group_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_tier = "Free"
}
