output "id" {
  description = "Resource ID of the namespace."
  value       = azurerm_servicebus_namespace.this.id
}

output "endpoint" {
  description = "Service Bus endpoint URL."
  value       = azurerm_servicebus_namespace.this.endpoint
}
