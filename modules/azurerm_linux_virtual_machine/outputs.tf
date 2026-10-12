output "id" {
  description = "Resource ID of the VM."
  value       = azurerm_linux_virtual_machine.this.id
}

output "private_ip_address" {
  description = "Private IP address of the VM."
  value       = azurerm_linux_virtual_machine.this.private_ip_address
}

output "network_interface_id" {
  description = "ID of the VM's network interface."
  value       = azurerm_network_interface.this.id
}

output "identity_principal_id" {
  description = "Principal ID of the system-assigned identity (null when not used)."
  value       = try(azurerm_linux_virtual_machine.this.identity[0].principal_id, null)
}
