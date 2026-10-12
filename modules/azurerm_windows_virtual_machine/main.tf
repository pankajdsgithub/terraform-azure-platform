resource "azurerm_network_interface" "nic" {
  name                           = "${var.name}-nic"
  resource_group_name            = var.resource_group_name
  location                       = var.location
  accelerated_networking_enabled = var.accelerated_networking_enabled
  tags                           = var.tags

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  name                  = var.name
  computer_name         = substr(var.name, 0, 15)
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.size
  zone                  = var.zone
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  license_type          = var.license_type
  network_interface_ids = [azurerm_network_interface.nic.id]
  tags                  = var.tags

  # Security baseline
  encryption_at_host_enabled = var.encryption_at_host_enabled
  secure_boot_enabled        = var.secure_boot_enabled
  vtpm_enabled               = var.vtpm_enabled
  allow_extension_operations = var.allow_extension_operations

  os_disk {
    caching                = "ReadWrite"
    storage_account_type   = var.os_disk_storage_account_type
    disk_size_gb           = var.os_disk_size_gb
    disk_encryption_set_id = var.disk_encryption_set_id
  }

  source_image_reference {
    publisher = var.image.publisher
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  dynamic "identity" {
    for_each = var.identity_type == null ? [] : [1]

    content {
      type         = var.identity_type
      identity_ids = var.identity_type == "SystemAssigned" ? null : var.identity_ids
    }
  }

  # Empty block = boot diagnostics with a Microsoft-managed storage account.
  boot_diagnostics {}
}
