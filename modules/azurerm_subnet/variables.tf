variable "subnets" {
  description = "Map of subnets. vnet_key must exist in virtual_networks."
  type = map(object({
    name             = string
    vnet_key         = string
    address_prefixes = list(string)
  }))
}

variable "virtual_networks" {
  description = "Output of the virtual network module (id, name, resource_group_name per key)."
  type = map(object({
    id                  = string
    name                = string
    resource_group_name = string
  }))
}
