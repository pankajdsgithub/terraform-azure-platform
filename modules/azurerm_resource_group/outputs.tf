output "resource_groups" {
  description = "Created resource groups keyed by logical name."
  value = {
    for key, rg in azurerm_resource_group.resource_group : key => {
      id       = rg.id
      name     = rg.name
      location = rg.location
    }
  }
}
