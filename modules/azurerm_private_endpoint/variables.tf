variable "name" {
  description = "Name of the private endpoint."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the endpoint is created in."
  type        = string
}

variable "location" {
  description = "Azure region (must match the subnet's region)."
  type        = string
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default     = {}
}

variable "subnet_id" {
  description = "Subnet the endpoint's network interface is placed in."
  type        = string
}

variable "target_resource_id" {
  description = "Resource ID of the service to connect to (storage account, key vault, SQL server, and so on)."
  type        = string
}

variable "subresource_names" {
  description = "Sub-resource to expose, for example [\"blob\"], [\"vault\"], [\"sqlServer\"], [\"registry\"]."
  type        = list(string)
}

variable "private_dns_zone_ids" {
  description = "Private DNS zone IDs for automatic DNS records. Leave empty to manage DNS yourself."
  type        = list(string)
  default     = []
}
