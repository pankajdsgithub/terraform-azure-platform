variable "scope" {
  description = "Resource ID the role is assigned on (subscription, resource group or resource)."
  type        = string
}

variable "role_definition_name" {
  description = "Built-in role name, for example Reader or Key Vault Secrets User. Prefer least privilege."
  type        = string
}

variable "principal_id" {
  description = "Object ID of the user, group, service principal or managed identity."
  type        = string
}

variable "principal_type" {
  description = "Optional: User, Group or ServicePrincipal. Set it when assigning to a newly created identity to avoid replication delays."
  type        = string
  default     = null
}

variable "description" {
  description = "Optional description of why the role is granted."
  type        = string
  default     = null
}

variable "skip_service_principal_aad_check" {
  description = "Skip the Azure AD check for new service principals (only needed in rare replication-delay cases)."
  type        = bool
  default     = false
}
