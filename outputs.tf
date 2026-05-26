output "id" {
  description = "ID of the ElastiCache parameter group"
  value       = try(aws_elasticache_parameter_group.this[0].id, null)
}

output "name" {
  description = "Name of the ElastiCache parameter group"
  value       = try(aws_elasticache_parameter_group.this[0].name, null)
}
