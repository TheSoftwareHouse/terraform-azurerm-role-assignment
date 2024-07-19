<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlIC9FYD-n7m_ASko0O_D11MeFdVV-CtFtqw&s">
</p>

# Azure Role Assignment Terraform Module

## Assign roles to users, groups and service principals

This Terraform module assigns `BUILT IN` roles to users, groups and service principals.

## Prerequisites

Following permissions are needed to use some features this module provides:

- `User.Read.All` or `Directory.Read.All` for assigning roles to users.

- `Group.Read.All` or `Directory.Read.All` for assigning roles to groups.

- `Application.Read.All` or `Directory.Read.All` for assigning roles to service principals.

## Usage

### Assign roles to users

```terraform
module "role_assignments" {
  source  = "TheSoftwareHouse/role-assignment/azurerm"
  version = "1.0.0"

  scope = azurerm_resource_group.this.id

  role_assignments = [
    {
      user_principal_names = ["user1@contoso.com", "user2@contoso.com"]
      role_names           = ["Reader", "Web Plan Contributor"]
    }
  ]
}
```

### Assign roles to groups

```terraform
module "role_assignments" {
  source  = "TheSoftwareHouse/role-assignment/azurerm"
  version = "1.0.0"

  scope = azurerm_resource_group.this.id

  role_assignments = [
    {
      group_names = ["group1", "group2", "group3"]
      role_names  = ["Reader", "Web Plan Contributor"]
    }
  ]
}
```

### Assign roles to service principals

```terraform
module "role_assignments" {
  source  = "TheSoftwareHouse/role-assignment/azurerm"
  version = "1.0.0"

  scope = azurerm_resource_group.this.id

  role_assignments = [
    {
      sp_names   = ["spname1", "spname2", "spname3"]
      role_names = ["Reader", "Web Plan Contributor"]
    }
  ]
}
```

### Assign roles to service principals but with principal ids

```terraform
module "role_assignments" {
  source  = "TheSoftwareHouse/role-assignment/azurerm"
  version = "1.0.0"

  scope = azurerm_resource_group.this.id

  role_assignments = [
    {
      principal_ids   = ["00000000-0000-0000-0000-000000000000"]
      role_names      = ["Reader", "Web Plan Contributor"]
    }
  ]
}
```

For the full usage, please refer to the [full example](./examples/role_assignment_complete).

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | >=2.53 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.113 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azuread"></a> [azuread](#provider\_azuread) | >=2.53 |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.113 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_role_assignment.group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.principal_id](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.service_principal](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.user](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azuread_group.group](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/group) | data source |
| [azuread_service_principal.sp](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/service_principal) | data source |
| [azuread_user.user](https://registry.terraform.io/providers/hashicorp/azuread/latest/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_role_assignments"></a> [role\_assignments](#input\_role\_assignments) | A list of role assignments to be created. | <pre>list(object({<br>    group_names             = optional(list(string), [])<br>    user_principal_names    = optional(list(string), [])<br>    service_principal_names = optional(list(string), [])<br>    principal_ids           = optional(list(string), [])<br>    role_names              = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_scope"></a> [scope](#input\_scope) | The scope at which the role assignments should be applied. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
