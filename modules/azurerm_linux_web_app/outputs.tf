output "id" {
  description = "Resource ID of the web app."
  value       = azurerm_linux_web_app.this.id
}

output "default_hostname" {
  description = "Default host name of the web app."
  value       = azurerm_linux_web_app.this.default_hostname
}

output "identity_principal_id" {
  description = "Principal ID of the system-assigned identity (null when not used)."
  value       = try(azurerm_linux_web_app.this.identity[0].principal_id, null)
}
