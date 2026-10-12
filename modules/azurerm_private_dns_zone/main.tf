resource "azurerm_private_dns_zone" "dns_zone" {
  name                = var.name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns_zone_link" {
  for_each = var.virtual_network_links

  name                 = each.key
  private_dns_zone_id  = azurerm_private_dns_zone.dns_zone.id
  virtual_network_id   = each.value.virtual_network_id
  registration_enabled = each.value.registration_enabled
  tags                 = var.tags
}
