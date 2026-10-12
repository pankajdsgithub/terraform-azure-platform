resource "azurerm_storage_account" "stg_account" {
  name                     = var.name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.account_tier
  account_replication_type = var.replication_type
  account_kind             = var.account_kind
  access_tier              = var.access_tier
  is_hns_enabled           = var.is_hns_enabled
  tags                     = var.tags

  # Security baseline
  min_tls_version                   = "TLS1_2"
  https_traffic_only_enabled        = true
  allow_nested_items_to_be_public   = var.allow_blob_public_access
  shared_access_key_enabled         = var.shared_access_key_enabled
  default_to_oauth_authentication   = var.default_to_oauth_authentication
  public_network_access_enabled     = var.public_network_access_enabled
  cross_tenant_replication_enabled  = false
  infrastructure_encryption_enabled = var.infrastructure_encryption_enabled

  blob_properties {
    versioning_enabled = var.versioning_enabled

    delete_retention_policy {
      days = var.soft_delete_days
    }

    container_delete_retention_policy {
      days = var.soft_delete_days
    }
  }

  dynamic "network_rules" {
    for_each = var.network_rules == null ? [] : [var.network_rules]

    content {
      default_action             = "Deny"
      bypass                     = ["AzureServices"]
      ip_rules                   = network_rules.value.ip_rules
      virtual_network_subnet_ids = network_rules.value.subnet_ids
    }
  }

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : [1]

    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "SystemAssigned" ? null : var.identity_ids
    }
  }
}

resource "azurerm_storage_container" "stg_container" {
  for_each = var.containers

  name                  = each.key
  storage_account_id    = azurerm_storage_account.stg_account.id
  container_access_type = each.value.access_type
}
