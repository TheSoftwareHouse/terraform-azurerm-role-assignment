<p align="center">
  <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlIC9FYD-n7m_ASko0O_D11MeFdVV-CtFtqw&s">
</p>

# Terraform Sample Module by TSH

This is template for sample module used within Terraform.

## How To Start

```bash
task install:tools
# create your module
# optionally
pre-commit run --all-files
```

## Quality Assurance

- make sure all checks pass before merging to main
- if you are sure code is ready for next release, make sure you maintain changelog for introduced changes
- in order to bootstrap module, use `terraform-main` repository and create GitHub repository from there in Terraform
- try to remember about consistent set of tags, they can be choosen and adjusted as needed, you can find sample set in `terraform-main`
- as for prefixes, try to stick with standard below (if possible, there are cases where name would be too long or it's enforced by cloud provider)

```hcl
locals {
  project_name = short_name
  environment = prd
  name_prefix = "${local.project_name}-${local.environment}"
}
```

- while handling outputs, remember to stick to original names e.g. module.vpc.vpc_id, in case there are multiple components, namespace each of outputs in it's source module name e.g. module.cluster.vpc.vpc_id and module.cluster.eks.oidc_issuer_url
- remember to split resources between files, either by resource types (e.g. s3.tf, ssm.tf, vpc.tf) or set of resources for specific purpose (eg. security_hub.tf).

## Changelog

### 0.0.1

- initial version, allows to create simple infrastructure

### 0.0.2

- added possibility to customise tags, by default they are empty so it's safe to upgrade (backwards compatible)

### 0.0.3

- adapted to new provider version, changed required version

## Copyrights

2024 The Software House - All rights reserved
