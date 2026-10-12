variable "name" {
  description = "Zone name, for example privatelink.blob.core.windows.net."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the zone is created in."
  type        = string
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default     = {}
}

variable "virtual_network_links" {
  description = "Map of link name => virtual network to link. registration_enabled auto-registers VM records."
  type = map(object({
    virtual_network_id   = string
    registration_enabled = optional(bool, false)
  }))
  default = {}
}
