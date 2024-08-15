resource "azurerm_resource_group" "rg" {
  name     = "karn-rg-${var.environment}"
  location = var.location
}

resource "azurerm_static_web_app" "static_web_app" {
  name                = var.resource_group_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  sku_tier = "Free"
}

resource "azurerm_mssql_server" "sqlserver" {
  name                         = "karn-sql-server-${var.environment}"
  resource_group_name          = var.resource_group_name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "karn-admin"
  administrator_login_password = var.sql_admin_password
  minimum_tls_version          = "1.2"

  tags = {
    environment = "production"
  }
}

resource "azurerm_mssql_database" "sqldatabase" {
  name                = "karn-base-sql-database-${var.environment}"
  resource_group_name = var.resource_group_name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sqlserver.name

  sku_name = "Basic"

  max_size_bytes = "1073741824" # 1 GB
  collation      = "SQL_Latin1_General_CP1_CI_AS"

  tags = {
    environment = var.environment
  }

  lifecycle {
    prevent_destroy = true
  }
}


