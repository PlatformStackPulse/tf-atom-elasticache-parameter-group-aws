# tf-atom-elasticache-parameter-group-aws

[![CI](https://github.com/PlatformStackPulse/tf-atom-elasticache-parameter-group-aws/actions/workflows/ci.yml/badge.svg)](https://github.com/PlatformStackPulse/tf-atom-elasticache-parameter-group-aws/actions/workflows/ci.yml)
![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.6.0-blueviolet)

## Purpose

ElastiCache parameter group for customizing Redis/Valkey configuration.

## Module Documentation

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | git::https://github.com/PlatformStackPulse/tf-label.git | v1.0.0 |

### Resources

| Name | Type |
|------|------|
| [aws_elasticache_parameter_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the parameter group | `string` | `null` | no |
| <a name="input_family"></a> [family](#input\_family) | ElastiCache parameter group family (e.g., redis7) | `string` | `"redis7"` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | List of ElastiCache parameters | <pre>list(object({<br/>    name  = string<br/>    value = string<br/>  }))</pre> | `[]` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the ElastiCache parameter group |
| <a name="output_name"></a> [name](#output\_name) | Name of the ElastiCache parameter group |
<!-- END_TF_DOCS -->
