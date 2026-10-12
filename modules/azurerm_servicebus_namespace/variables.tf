variable "name" {
  description = "Namespace name (globally unique)."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the namespace is created in."
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

variable "sku" {
  description = "Basic, Standard or Premium. Private endpoints need Premium."
  type        = string
  default     = "Standard"
}

variable "capacity" {
  description = "Messaging units (Premium only: 1, 2, 4, 8 or 16). Null for other SKUs."
  type        = number
  default     = null
}

variable "local_auth_enabled" {
  description = "Allow shared access keys. Set false for Entra ID only."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Allow public network access. Set false and use a private endpoint (Premium) for production."
  type        = bool
  default     = true
}

variable "queues" {
  description = "Queue names to create."
  type        = set(string)
  default     = []
}

variable "topics" {
  description = "Topic names to create (Standard or Premium)."
  type        = set(string)
  default     = []
}
