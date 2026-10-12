resource "azurerm_linux_web_app" "linux_web_app" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = var.service_plan_id
  app_settings        = var.app_settings
  tags                = var.tags

  # Security baseline
  https_only                    = true
  client_certificate_enabled    = var.client_certificate_enabled
  public_network_access_enabled = var.public_network_access_enabled
  virtual_network_subnet_id     = var.virtual_network_subnet_id

  site_config {
    always_on           = var.always_on
    minimum_tls_version = "1.2"
    ftps_state          = "Disabled"
    http2_enabled       = true

    dynamic "application_stack" {
      for_each = var.application_stack == null ? [] : [var.application_stack]

      content {
        python_version      = application_stack.value.python_version
        node_version        = application_stack.value.node_version
        dotnet_version      = application_stack.value.dotnet_version
        java_version        = application_stack.value.java_version
        docker_image_name   = application_stack.value.docker_image_name
        docker_registry_url = application_stack.value.docker_registry_url
      }
    }

    dynamic "ip_restriction" {
      for_each = var.allowed_ip_addresses

      content {
        name       = "allow-${ip_restriction.key}"
        ip_address = ip_restriction.value
        action     = "Allow"
        priority   = 100 + ip_restriction.key
      }
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
