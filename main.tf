resource "azurerm_role_assignment" "group" {
  for_each = { for idx, assignment in local.group_assignments : idx => assignment if assignment.principal_type == "Group" }

  scope                = var.scope
  role_definition_name = each.value.role_name
  principal_type       = each.value.principal_type
  principal_id         = data.azuread_group.this[each.key].object_id
}

resource "azurerm_role_assignment" "user" {
  for_each = { for idx, assignment in local.user_assignments : idx => assignment if assignment.principal_type == "User" }

  scope                = var.scope
  role_definition_name = each.value.role_name
  principal_type       = each.value.principal_type
  principal_id         = data.azuread_user.this[each.key].object_id
}

resource "azurerm_role_assignment" "service_principal" {
  for_each = { for idx, assignment in local.sp_assignments : idx => assignment if assignment.principal_type == "ServicePrincipal" }

  scope                = var.scope
  role_definition_name = each.value.role_name
  principal_type       = each.value.principal_type
  principal_id         = data.azuread_service_principal.this[each.key].object_id
}

resource "azurerm_role_assignment" "principal_id" {
  for_each = { for idx, assignment in local.principal_id_assignments : idx => assignment }

  scope                = var.scope
  role_definition_name = each.value.role_name
  principal_id         = each.value.principal_id
}
