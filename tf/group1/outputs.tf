output "static_web_app_id" {
  value = azurerm_static_web_app.static_web_app.id
}

output "static_web_app_default_host_name" {
  value = azurerm_static_web_app.static_web_app.default_host_name
}

# Output the Fully Qualified Domain Name (FQDN) of the SQL Server
# output "sql_server_fqdn" {
#   description = "The fully qualified domain name of the Azure SQL Server"
#   value       = azurerm_sql_server.sql_server.fully_qualified_domain_name
# }

# # Output the ID of the SQL Server
# output "sql_server_id" {
#   description = "The ID of the Azure SQL Server"
#   value       = azurerm_sql_server.sql_server.id
# }

# # Output a list of dropped restorable database IDs on the server
# output "restorable_dropped_database_ids" {
#   description = "A list of dropped restorable database IDs on the SQL Server"
#   value       = azurerm_sql_server.sql_server.restorable_dropped_database_ids
# }

# # Output the name of the SQL Database
# output "sql_database_name" {
#   description = "The name of the Azure SQL Database"
#   value       = azurerm_sql_database.sql_database.name
# }
