variable "name" {
  description = "Name of the public IP."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the public IP is created in."
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

variable "allocation_method" {
  description = "Static or Dynamic. Standard SKU requires Static."
  type        = string
  default     = "Static"
}

variable "sku" {
  description = "Standard (secure by default, closed to inbound traffic until an NSG allows it) or Basic."
  type        = string
  default     = "Standard"
}

variable "zones" {
  description = "Availability zones, for example [\"1\", \"2\", \"3\"] for a zone-redundant Standard IP."
  type        = list(string)
  default     = null
}

variable "domain_name_label" {
  description = "Optional DNS label (<label>.<region>.cloudapp.azure.com)."
  type        = string
  default     = null
}

variable "idle_timeout_in_minutes" {
  description = "TCP idle timeout, 4 to 30 minutes."
  type        = number
  default     = 4
}
