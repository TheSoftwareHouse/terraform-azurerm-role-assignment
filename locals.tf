locals {
  group_assignments = flatten([
    for ra in var.role_assignments : [
      for group_name in ra.group_names : [
        for role_name in ra.role_names : {
          principal_name = group_name
          principal_type = "Group"
          role_name      = role_name
        }
      ]
    ]
  ])

  user_assignments = flatten([
    for ra in var.role_assignments : [
      for user_principal_name in ra.user_principal_names : [
        for role_name in ra.role_names : {
          principal_name = user_principal_name
          principal_type = "User"
          role_name      = role_name
        }
      ]
    ]
  ])

  sp_assignments = flatten([
    for ra in var.role_assignments : [
      for sp_name in ra.service_principal_names : [
        for role_name in ra.role_names : {
          principal_name = sp_name
          principal_type = "ServicePrincipal"
          role_name      = role_name
        }
      ]
    ]
  ])

  principal_id_assignments = flatten([
    for ra in var.role_assignments : [
      for principal_id in ra.principal_ids : [
        for role_name in ra.role_names : {
          principal_id   = principal_id
          principal_type = "ServicePrincipal"
          role_name      = role_name
        }
      ]
    ]
  ])
}
