resource "azurerm_servicebus_namespace" "svcbus_namespace" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = var.sku
  capacity            = var.capacity
  tags                = var.tags

  # Security baseline
  minimum_tls_version           = "1.2"
  local_auth_enabled            = var.local_auth_enabled
  public_network_access_enabled = var.public_network_access_enabled
}

resource "azurerm_servicebus_queue" "svcbus_queue" {
  for_each = var.queues

  name         = each.value
  namespace_id = azurerm_servicebus_namespace.this.id
}

resource "azurerm_servicebus_topic" "svcbus_topic" {
  for_each = var.topics

  name         = each.value
  namespace_id = azurerm_servicebus_namespace.svcbus_namespace.id
}
