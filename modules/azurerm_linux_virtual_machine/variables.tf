variable "name" {
  description = "Name of the virtual machine."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the VM is created in."
  type        = string
}

variable "location" {
  description = "Azure region."
  type        = string
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "Subnet the VM's network interface joins."
  type        = string
}

variable "admin_username" {
  description = "Admin user name (not 'admin' or 'root')."
  type        = string
  default     = "azureuser"
}

variable "admin_ssh_public_key" {
  description = "SSH public key content. Password login is always disabled."
  type        = string
}

variable "size" {
  description = "VM size."
  type        = string
  default     = "Standard_B2s"
}

variable "zone" {
  description = "Availability zone: 1, 2 or 3."
  type        = string
  default     = null
}

variable "public_ip_address_id" {
  description = "Optional public IP. Leave null and use Azure Bastion for admin access."
  type        = string
  default     = null
}

variable "accelerated_networking_enabled" {
  description = "Enable accelerated networking (needs a supported VM size)."
  type        = bool
  default     = false
}

variable "image" {
  description = "Marketplace image. Default is Ubuntu 22.04 LTS Gen2."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

variable "os_disk_storage_account_type" {
  description = "OS disk type."
  type        = string
  default     = "StandardSSD_LRS"
}

variable "os_disk_size_gb" {
  description = "OS disk size in GB. Null uses the image default."
  type        = number
  default     = null
}

variable "disk_encryption_set_id" {
  description = "Optional customer-managed key for the OS disk."
  type        = string
  default     = null
}

variable "identity_type" {
  description = "Managed identity: SystemAssigned, UserAssigned or null for none. Prefer identities over stored credentials."
  type        = string
  default     = null
}

variable "identity_ids" {
  description = "User-assigned identity IDs (when identity_type is UserAssigned)."
  type        = list(string)
  default     = null
}

variable "encryption_at_host_enabled" {
  description = "Encrypt temp disks and caches at the host. Needs the EncryptionAtHost feature on the subscription."
  type        = bool
  default     = false
}

variable "secure_boot_enabled" {
  description = "Trusted launch secure boot. Needs a Gen2 image and a supported size."
  type        = bool
  default     = false
}

variable "vtpm_enabled" {
  description = "Trusted launch vTPM. Needs a Gen2 image and a supported size."
  type        = bool
  default     = false
}

variable "allow_extension_operations" {
  description = "Allow VM extensions. Set false for a locked-down VM."
  type        = bool
  default     = true
}
