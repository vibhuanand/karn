
resource "azurerm_sql_server" "sql_server" {
  name                         = "karn-sql-server-${var.environment}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = "12.0"
  administrator_login          = "karn-admin"
  administrator_login_password = var.sql_admin_password

  tags = {
    environment = var.environment
  }
}

resource "azurerm_sql_database" "sql_database" {
  name                = "karn-sql-database-${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  server_name         = azurerm_sql_server.sql_server.name
  collation           = "SQL_Latin1_General_CP1_CI_AS"
  max_size_bytes      = 1073741824 // 1 GB

  read_scale = false

  tags = {
    environment = var.environment
  }
}
