output "id" {
  description = "Resource ID of the storage account."
  value       = azurerm_storage_account.stg_account.id
}

output "name" {
  description = "Name of the storage account."
  value       = azurerm_storage_account.stg_account.name
}

output "primary_blob_endpoint" {
  description = "Primary blob service endpoint."
  value       = azurerm_storage_account.stg_account.primary_blob_endpoint
}

output "container_ids" {
  description = "Container IDs keyed by container name."
  value       = { for name, container in azurerm_storage_container.stg_container : name => container.id }
}
