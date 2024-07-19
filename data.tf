data "azuread_group" "this" {
  for_each     = { for idx, assignment in local.group_assignments : idx => assignment if assignment.principal_type == "Group" }
  display_name = each.value.principal_name
}

data "azuread_user" "this" {
  for_each            = { for idx, assignment in local.user_assignments : idx => assignment if assignment.principal_type == "User" }
  user_principal_name = each.value.principal_name
}

data "azuread_service_principal" "this" {
  for_each     = { for idx, assignment in local.sp_assignments : idx => assignment if assignment.principal_type == "ServicePrincipal" }
  display_name = each.value.principal_name
}
