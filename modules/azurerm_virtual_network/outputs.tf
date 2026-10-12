output "virtual_networks" {
  description = "Created virtual networks keyed by logical name."
  value = {
    for key, vnet in azurerm_virtual_network.virtual_network : key => {
      id                  = vnet.id
      name                = vnet.name
      resource_group_name = vnet.resource_group_name
    }
  }
}
