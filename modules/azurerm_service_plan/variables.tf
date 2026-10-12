variable "name" {
  description = "Name of the App Service plan."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the plan is created in."
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

variable "os_type" {
  description = "Linux or Windows."
  type        = string
  default     = "Linux"
}

variable "sku_name" {
  description = "Plan size, for example B1, S1, P1v3. Free (F1) cannot run Always On."
  type        = string
  default     = "B1"
}

variable "zone_balancing_enabled" {
  description = "Spread instances across zones (Premium v2/v3 plans with at least 2 instances)."
  type        = bool
  default     = false
}
