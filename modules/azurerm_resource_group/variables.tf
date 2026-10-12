variable "rgs" {
  description = "Map of resource groups to create. The map key is the logical name other modules reference."
  type = map(object({
    name     = string
    location = string
  }))
}

variable "tags" {
  description = "Tags applied to every resource group."
  type        = map(string)
  default     = {}
}
