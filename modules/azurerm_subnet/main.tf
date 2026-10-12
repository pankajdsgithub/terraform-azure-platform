
resource "azurerm_subnet" "subnet" {
  for_each = var.subnets

  name                 = each.value.name
  resource_group_name  = var.virtual_networks[each.value.vnet_key].resource_group_name
  virtual_network_name = var.virtual_networks[each.value.vnet_key].name
  address_prefixes     = each.value.address_prefixes
}
