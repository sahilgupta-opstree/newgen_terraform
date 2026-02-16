variable "region" {
  type = string
}


# -----------------------------------------------------------------------------------------
variable "env" {
  description = "Environment name (e.g., dev, qa, prod)."
  type        = string
  default     = ""
}

variable "bu" {
  description = "Business unit name (e.g., ot, fin, hr)."
  type        = string
  default     = ""
}

variable "app" {
  description = "Application name (e.g., bp, network, shared)."
  type        = string
  default     = ""
}

variable "tenant" {
  description = "Tenant name (used in multi-tenant setups, optional)."
  type        = string
  default     = ""
}

variable "assume_role_service" {
  type = string
}

variable "roles" {
  type = map(object({
    managed_policy_arns = list(string)
    custom_policy_names = list(string)
  }))
}

variable "custom_policies" {
  type = map(object({
    description = string
    policy_json = string
  }))
}
