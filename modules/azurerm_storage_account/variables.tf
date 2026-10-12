variable "name" {
  description = "Storage account name: 3-24 lowercase letters and numbers, globally unique."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the account is created in."
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

variable "account_tier" {
  description = "Standard or Premium."
  type        = string
  default     = "Standard"
}

variable "replication_type" {
  description = "LRS, ZRS, GRS, GZRS, RAGRS or RAGZRS. Use ZRS or GZRS for production."
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "StorageV2 (default), BlobStorage, BlockBlobStorage or FileStorage."
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Hot or Cool default access tier."
  type        = string
  default     = "Hot"
}

variable "is_hns_enabled" {
  description = "Enable hierarchical namespace (Data Lake Gen2)."
  type        = bool
  default     = false
}

variable "containers" {
  description = "Blob containers to create. Map key is the container name. access_type: private, blob or container."
  type = map(object({
    access_type = optional(string, "private")
  }))
  default = {}
}

variable "allow_blob_public_access" {
  description = "Allow containers to be made publicly readable. Keep false."
  type        = bool
  default     = false
}

variable "shared_access_key_enabled" {
  description = "Allow access keys and SAS tokens. Set false for Entra ID only (the Terraform azurerm provider then needs storage_use_azuread = true to manage containers)."
  type        = bool
  default     = true
}

variable "default_to_oauth_authentication" {
  description = "Make the Azure portal use Entra ID authentication by default."
  type        = bool
  default     = false
}

variable "public_network_access_enabled" {
  description = "Allow public network access. Set false and use a private endpoint for production."
  type        = bool
  default     = true
}

variable "network_rules" {
  description = "Optional firewall. When set, default action becomes Deny and only the listed IP ranges and subnets (plus trusted Azure services) are allowed."
  type = object({
    ip_rules   = optional(list(string), [])
    subnet_ids = optional(list(string), [])
  })
  default = null
}

variable "infrastructure_encryption_enabled" {
  description = "Double encryption at rest. Can only be set at creation."
  type        = bool
  default     = false
}

variable "versioning_enabled" {
  description = "Keep previous versions of blobs."
  type        = bool
  default     = true
}

variable "soft_delete_days" {
  description = "Days deleted blobs and containers are recoverable (1-365)."
  type        = number
  default     = 7
}

variable "identity_type" {
  description = "Managed identity: SystemAssigned, UserAssigned or null for none."
  type        = string
  default     = null
}

variable "identity_ids" {
  description = "User-assigned identity IDs (when identity_type is UserAssigned)."
  type        = list(string)
  default     = null
}
