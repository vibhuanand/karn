provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# resource "azurerm_app_service_plan" "asp" {
#   name                = "myAppServicePlan"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   sku {
#     tier     = "Basic"
#     size     = "B1"
#   }
# }

# resource "azurerm_app_service" "app" {
#   name                = "myWebApp"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   app_service_plan_id = azurerm_app_service_plan.asp.id

#   site_config {
#     always_on = true
#   }

#   app_settings = {
#     "WEBSITE_RUN_FROM_PACKAGE" = "1"
#   }
# }

# resource "azurerm_sql_server" "sqlserver" {
#   name                         = "mySqlServer"
#   resource_group_name          = azurerm_resource_group.rg.name
#   location                     = azurerm_resource_group.rg.location
#   version                      = "12.0"
#   administrator_login          = "sqladmin"
#   administrator_login_password = "H@Sh1CoR3!"
# }

# resource "azurerm_sql_database" "sqldb" {
#   name                = "mySqlDatabase"
#   resource_group_name = azurerm_resource_group.rg.name
#   location            = azurerm_resource_group.rg.location
#   server_name         = azurerm_sql_server.sqlserver.name
#   sku_name            = "S1"
# }

# resource "azurerm_key_vault" "kv" {
#   name                        = "myKeyVault"
#   location                    = azurerm_resource_group.rg.location
#   resource_group_name         = azurerm_resource_group.rg.name
#   tenant_id                   = data.azurerm_client_config.current.tenant_id
#   sku_name                    = "standard"
#   soft_delete_enabled         = true
#   purge_protection_enabled    = true
# }

# resource "azurerm_key_vault_secret" "sql_conn_string" {
#   name         = "SqlConnectionString"
#   value        = azurerm_sql_server.sqlserver.administrator_login_password
#   key_vault_id = azurerm_key_vault.kv.id
# }

output "webapp_url" {
  value = azurerm_app_service.app.default_site_hostname
}
