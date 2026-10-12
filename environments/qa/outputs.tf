output "resource_group_names" {
  description = "Resource group names keyed by logical name."
  value       = { for key, rg in module.resource_group.resource_groups : key => rg.name }
}

output "virtual_network_ids" {
  description = "Virtual network IDs keyed by logical name."
  value       = { for key, vnet in module.virtual_network.virtual_networks : key => vnet.id }
}

output "subnet_ids" {
  description = "Subnet IDs keyed by logical name."
  value       = { for key, subnet in module.subnet.subnets : key => subnet.id }
}
