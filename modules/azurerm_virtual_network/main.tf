resource "azurerm_virtual_network" "virtual_network" {
  for_each = var.vnets

  name                = each.value.name
  resource_group_name = var.resource_groups[each.value.resource_group_key].name
  location            = var.resource_groups[each.value.resource_group_key].location
  address_space       = each.value.address_space
  tags                = var.tags
}
