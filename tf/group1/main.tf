resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}


resource "azurerm_static_site" "static_site" {
  name                = "karn-static-site-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku_tier            = "Standard"

  identity {
    type = "SystemAssigned"
  }
}
