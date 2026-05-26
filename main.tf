resource "aws_elasticache_parameter_group" "this" {
  count = local.enabled ? 1 : 0

  name        = module.this.id
  family      = var.family
  description = coalesce(var.description, "ElastiCache parameter group for ${module.this.id}")

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }

  tags = local.tags
}
