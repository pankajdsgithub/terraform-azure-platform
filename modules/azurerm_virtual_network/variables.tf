variable "vnets" {
  description = "Map of virtual networks. resource_group_key must exist in resource_groups."
  type = map(object({
    name               = string
    resource_group_key = string
    address_space      = list(string)
  }))
}

variable "resource_groups" {
  description = "Output of the resource group module (id, name, location per key)."
  type = map(object({
    id       = string
    name     = string
    location = string
  }))
}

variable "tags" {
  description = "Tags applied to every virtual network."
  type        = map(string)
  default     = {}
}
