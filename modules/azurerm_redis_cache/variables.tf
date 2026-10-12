variable "name" {
  description = "Cache name (globally unique)."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the cache is created in."
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

variable "sku_name" {
  description = "Basic, Standard or Premium."
  type        = string
  default     = "Standard"
}

variable "family" {
  description = "C for Basic/Standard, P for Premium."
  type        = string
  default     = "C"
}

variable "capacity" {
  description = "Size within the family (C: 0-6, P: 1-5)."
  type        = number
  default     = 1
}

variable "zones" {
  description = "Availability zones (Premium)."
  type        = list(string)
  default     = null
}

variable "subnet_id" {
  description = "Subnet to inject the cache into (Premium only)."
  type        = string
  default     = null
}

variable "public_network_access_enabled" {
  description = "Allow public network access. Set false and use a private endpoint for production."
  type        = bool
  default     = true
}
