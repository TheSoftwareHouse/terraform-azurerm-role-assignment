variable "scope" {
  description = "The scope at which the role assignments should be applied."
  type        = string
}

variable "role_assignments" {
  description = "A list of role assignments to be created."
  type = list(object({
    group_names             = optional(list(string), [])
    user_principal_names    = optional(list(string), [])
    service_principal_names = optional(list(string), [])
    principal_ids           = optional(list(string), [])
    role_names              = list(string)
  }))

  validation {
    condition     = length([for ra in var.role_assignments : ra if length(ra.group_names) > 0 || length(ra.user_principal_names) > 0 || length(ra.service_principal_names) > 0 || length(ra.principal_ids) > 0]) > 0
    error_message = "At least one of group_names, user_principal_names, service_principal_names, or principal_ids must be specified in each role assignment."
  }
}
