variable "name" {
  description = "Name of the peering (one direction only; create a second peering for the reverse direction)."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group of the local virtual network."
  type        = string
}

variable "virtual_network_name" {
  description = "Name of the local virtual network."
  type        = string
}

variable "remote_virtual_network_id" {
  description = "Resource ID of the remote virtual network."
  type        = string
}

variable "allow_virtual_network_access" {
  description = "Allow traffic between the two networks."
  type        = bool
  default     = true
}

variable "allow_forwarded_traffic" {
  description = "Accept traffic forwarded by an appliance in the remote network. Keep false unless needed."
  type        = bool
  default     = false
}

variable "allow_gateway_transit" {
  description = "Let the remote network use this network's gateway."
  type        = bool
  default     = false
}

variable "use_remote_gateways" {
  description = "Use the remote network's gateway."
  type        = bool
  default     = false
}
