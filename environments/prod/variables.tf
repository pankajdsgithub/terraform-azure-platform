variable "environment" {
  description = "Environment name."
  type        = string

  validation {
    condition     = contains(["dev", "qa", "prod"], var.environment)
    error_message = "environment must be one of: dev, qa, prod."
  }
}

variable "tags" {
  description = "Extra tags merged with the standard tags."
  type        = map(string)
  default     = {}
}

variable "rgs" {
  description = "Map of resource groups to create."
  type = map(object({
    name     = string
    location = string
  }))
}

variable "vnets" {
  description = "Map of virtual networks to create."
  type = map(object({
    name               = string
    resource_group_key = string
    address_space      = list(string)
  }))
}

variable "subnets" {
  description = "Map of subnets to create."
  type = map(object({
    name             = string
    vnet_key         = string
    address_prefixes = list(string)
  }))
}
