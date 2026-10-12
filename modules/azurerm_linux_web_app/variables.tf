variable "name" {
  description = "Web app name (globally unique, becomes <name>.azurewebsites.net)."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group the web app is created in."
  type        = string
}

variable "location" {
  description = "Azure region (same as the plan)."
  type        = string
}

variable "tags" {
  description = "Tags to apply."
  type        = map(string)
  default     = {}
}

variable "service_plan_id" {
  description = "ID of a Linux App Service plan."
  type        = string
}

variable "application_stack" {
  description = "Runtime. Set exactly one of the version fields, or a docker image. Example: { python_version = \"3.12\" }."
  type = object({
    python_version      = optional(string)
    node_version        = optional(string)
    dotnet_version      = optional(string)
    java_version        = optional(string)
    docker_image_name   = optional(string)
    docker_registry_url = optional(string)
  })
  default = null
}

variable "app_settings" {
  description = "Application settings. Do not put secrets here; use Key Vault references."
  type        = map(string)
  default     = {}
}

variable "always_on" {
  description = "Keep the app loaded. Not available on Free plans."
  type        = bool
  default     = true
}

variable "public_network_access_enabled" {
  description = "Allow public network access. Set false and use a private endpoint for internal apps."
  type        = bool
  default     = true
}

variable "client_certificate_enabled" {
  description = "Require client TLS certificates (mutual TLS)."
  type        = bool
  default     = false
}

variable "virtual_network_subnet_id" {
  description = "Optional subnet for regional VNet integration (outbound traffic)."
  type        = string
  default     = null
}

variable "allowed_ip_addresses" {
  description = "Optional CIDRs allowed to reach the app, for example [\"203.0.113.10/32\"]. Any value denies all other traffic."
  type        = list(string)
  default     = []
}

variable "identity_type" {
  description = "Managed identity: SystemAssigned, UserAssigned or null for none."
  type        = string
  default     = null
}

variable "identity_ids" {
  description = "User-assigned identity IDs (when identity_type is UserAssigned)."
  type        = list(string)
  default     = null
}
