output "static_web_app_id" {
  value = azurerm_static_web_app.static_web_app.id
}

output "static_web_app_default_host_name" {
  value = azurerm_static_web_app.static_web_app.default_host_name
}

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
