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

# provider.tf
provider "azurerm" {
  features {}
}

# main.tf
resource "azurerm_resource_group" "rg" {
  name     = "karn-sql-rg"
  location = "Central India"
}

resource "azurerm_sql_server" "sql_server" {
  name                         = "karnsqlserver"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "sqladmin"
  administrator_login_password = "P@ssword1234"
}

resource "azurerm_sql_database" "sql_db" {
  name                = "karnsqldb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sql_server.name

  sku {
    name     = "S0"
    capacity = 10
    tier     = "Standard"
    family   = "Gen5"
  }
}

# outputs.tf
output "sql_server_name" {
  value = azurerm_sql_server.sql_server.name
}

output "sql_database_name" {
  value = azurerm_sql_database.sql_db.name
}

output "sql_admin_username" {
  value = azurerm_sql_server.sql_server.administrator_login
}

output "sql_admin_password" {
  value = azurerm_sql_server.sql_server.administrator_login_password
}

output "sql_connection_string" {
  value = "Server=tcp:${azurerm_sql_server.sql_server.name}.database.windows.net,1433;Initial Catalog=${azurerm_sql_database.sql_db.name};Persist Security Info=False;User ID=${azurerm_sql_server.sql_server.administrator_login};Password=${azurerm_sql_server.sql_server.administrator_login_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}
