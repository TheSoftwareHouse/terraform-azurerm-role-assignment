# Azure Role Assignment Module

Terraform module that assigns `BUILT IN` IAM roles to groups, service principals and users.

## Usage

```terraform
provider "azurerm" {
  features {}
}

provider "azuread" {}

resource "azurerm_resource_group" "this" {
  name     = "rg-example"
  location = "West Europe"
}

module "role_assignments" {
  source  = "TheSoftwareHouse/role-assignment/azurerm"
  version = "1.0.0"

  scope = azurerm_resource_group.this.id

  role_assignments = [
    {
      user_principal_names = ["test@example.com", "test2@example.com"]
      role_names           = ["Contributor", "Reader"]
    },
    {
      group_names = ["Group1"]
      role_names  = ["Reader"]
    },
    {
      service_principal_names = ["test"]
      role_names              = ["Contributor"]
    },
    {
      principal_ids = ["00000000-0000-0000-0000-000000000000"]
      role_names    = ["Reader"]
    }
  ]
}
```

## Terraform

To run this example you need to execute:

```bash
terraform init
terraform plan
terraform apply
```

You can destroy created resources with `terraform destroy`.
