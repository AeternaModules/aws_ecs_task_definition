output "ecs_task_definitions_id" {
  description = "Map of id values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "ecs_task_definitions_arn" {
  description = "Map of arn values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "ecs_task_definitions_arn_without_revision" {
  description = "Map of arn_without_revision values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.arn_without_revision if v.arn_without_revision != null && length(v.arn_without_revision) > 0 }
}
output "ecs_task_definitions_container_definitions" {
  description = "Map of container_definitions values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.container_definitions if v.container_definitions != null && length(v.container_definitions) > 0 }
}
output "ecs_task_definitions_cpu" {
  description = "Map of cpu values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.cpu if v.cpu != null && length(v.cpu) > 0 }
}
output "ecs_task_definitions_enable_fault_injection" {
  description = "Map of enable_fault_injection values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.enable_fault_injection if v.enable_fault_injection != null }
}
output "ecs_task_definitions_ephemeral_storage" {
  description = "Map of ephemeral_storage values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => one(v.ephemeral_storage) if v.ephemeral_storage != null && length(v.ephemeral_storage) > 0 }
}
output "ecs_task_definitions_execution_role_arn" {
  description = "Map of execution_role_arn values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.execution_role_arn if v.execution_role_arn != null && length(v.execution_role_arn) > 0 }
}
output "ecs_task_definitions_family" {
  description = "Map of family values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.family if v.family != null && length(v.family) > 0 }
}
output "ecs_task_definitions_ipc_mode" {
  description = "Map of ipc_mode values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.ipc_mode if v.ipc_mode != null && length(v.ipc_mode) > 0 }
}
output "ecs_task_definitions_memory" {
  description = "Map of memory values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.memory if v.memory != null && length(v.memory) > 0 }
}
output "ecs_task_definitions_network_mode" {
  description = "Map of network_mode values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.network_mode if v.network_mode != null && length(v.network_mode) > 0 }
}
output "ecs_task_definitions_pid_mode" {
  description = "Map of pid_mode values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.pid_mode if v.pid_mode != null && length(v.pid_mode) > 0 }
}
output "ecs_task_definitions_placement_constraints" {
  description = "Map of placement_constraints values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.placement_constraints if v.placement_constraints != null && length(v.placement_constraints) > 0 }
}
output "ecs_task_definitions_proxy_configuration" {
  description = "Map of proxy_configuration values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => one(v.proxy_configuration) if v.proxy_configuration != null && length(v.proxy_configuration) > 0 }
}
output "ecs_task_definitions_region" {
  description = "Map of region values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.region if v.region != null && length(v.region) > 0 }
}
output "ecs_task_definitions_requires_compatibilities" {
  description = "Map of requires_compatibilities values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.requires_compatibilities if v.requires_compatibilities != null && length(v.requires_compatibilities) > 0 }
}
output "ecs_task_definitions_revision" {
  description = "Map of revision values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.revision if v.revision != null }
}
output "ecs_task_definitions_runtime_platform" {
  description = "Map of runtime_platform values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => one(v.runtime_platform) if v.runtime_platform != null && length(v.runtime_platform) > 0 }
}
output "ecs_task_definitions_skip_destroy" {
  description = "Map of skip_destroy values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.skip_destroy if v.skip_destroy != null }
}
output "ecs_task_definitions_tags" {
  description = "Map of tags values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "ecs_task_definitions_tags_all" {
  description = "Map of tags_all values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}
output "ecs_task_definitions_task_role_arn" {
  description = "Map of task_role_arn values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.task_role_arn if v.task_role_arn != null && length(v.task_role_arn) > 0 }
}
output "ecs_task_definitions_track_latest" {
  description = "Map of track_latest values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.track_latest if v.track_latest != null }
}
output "ecs_task_definitions_volume" {
  description = "Map of volume values across all ecs_task_definitions, keyed the same as var.ecs_task_definitions"
  value       = { for k, v in aws_ecs_task_definition.ecs_task_definitions : k => v.volume if v.volume != null && length(v.volume) > 0 }
}

