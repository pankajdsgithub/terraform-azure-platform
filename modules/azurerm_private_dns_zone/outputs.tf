output "id" {
  description = "Resource ID of the zone (pass to the private endpoint module)."
  value       = azurerm_private_dns_zone.this.id
}

output "name" {
  description = "Name of the zone."
  value       = azurerm_private_dns_zone.this.name
}
