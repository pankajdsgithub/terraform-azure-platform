output "id" {
  description = "Resource ID of the identity."
  value       = azurerm_user_assigned_identity.uaid.id
}

output "principal_id" {
  description = "Object (principal) ID, used for role assignments."
  value       = azurerm_user_assigned_identity.uaid.principal_id
}

output "client_id" {
  description = "Client ID of the identity."
  value       = azurerm_user_assigned_identity.uaid.client_id
}
