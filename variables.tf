variable "ecs_task_definitions" {
  description = <<EOT
Map of ecs_task_definitions, attributes below
Required:
    - container_definitions
    - family
Optional:
    - cpu
    - enable_fault_injection
    - execution_role_arn
    - ipc_mode
    - memory
    - network_mode
    - pid_mode
    - region
    - requires_compatibilities
    - skip_destroy
    - tags
    - tags_all
    - task_role_arn
    - track_latest
    - ephemeral_storage (block):
        - size_in_gib (required)
    - placement_constraints (block):
        - expression (optional)
        - type (required)
    - proxy_configuration (block):
        - container_name (required)
        - properties (optional)
        - type (optional)
    - runtime_platform (block):
        - cpu_architecture (optional)
        - operating_system_family (optional)
    - volume (block):
        - configure_at_launch (optional)
        - docker_volume_configuration (optional, block):
            - autoprovision (optional)
            - driver (optional)
            - driver_opts (optional)
            - labels (optional)
            - scope (optional)
        - efs_volume_configuration (optional, block):
            - authorization_config (optional, block):
                - access_point_id (optional)
                - iam (optional)
            - file_system_id (required)
            - root_directory (optional)
            - transit_encryption (optional)
            - transit_encryption_port (optional)
        - fsx_windows_file_server_volume_configuration (optional, block):
            - authorization_config (required, block):
                - credentials_parameter (required)
                - domain (required)
            - file_system_id (required)
            - root_directory (required)
        - host_path (optional)
        - name (required)
        - s3files_volume_configuration (optional, block):
            - access_point_arn (optional)
            - file_system_arn (required)
            - root_directory (optional)
            - transit_encryption_port (optional)
EOT

  type = map(object({
    container_definitions    = string
    family                   = string
    cpu                      = optional(string)
    enable_fault_injection   = optional(bool)
    execution_role_arn       = optional(string)
    ipc_mode                 = optional(string)
    memory                   = optional(string)
    network_mode             = optional(string)
    pid_mode                 = optional(string)
    region                   = optional(string)
    requires_compatibilities = optional(set(string))
    skip_destroy             = optional(bool)
    tags                     = optional(map(string))
    tags_all                 = optional(map(string))
    task_role_arn            = optional(string)
    track_latest             = optional(bool)
    ephemeral_storage = optional(object({
      size_in_gib = number
    }))
    placement_constraints = optional(list(object({
      expression = optional(string)
      type       = string
    })))
    proxy_configuration = optional(object({
      container_name = string
      properties     = optional(map(string))
      type           = optional(string)
    }))
    runtime_platform = optional(object({
      cpu_architecture        = optional(string)
      operating_system_family = optional(string)
    }))
    volume = optional(list(object({
      configure_at_launch = optional(bool)
      docker_volume_configuration = optional(object({
        autoprovision = optional(bool)
        driver        = optional(string)
        driver_opts   = optional(map(string))
        labels        = optional(map(string))
        scope         = optional(string)
      }))
      efs_volume_configuration = optional(object({
        authorization_config = optional(object({
          access_point_id = optional(string)
          iam             = optional(string)
        }))
        file_system_id          = string
        root_directory          = optional(string)
        transit_encryption      = optional(string)
        transit_encryption_port = optional(number)
      }))
      fsx_windows_file_server_volume_configuration = optional(object({
        authorization_config = object({
          credentials_parameter = string
          domain                = string
        })
        file_system_id = string
        root_directory = string
      }))
      host_path = optional(string)
      name      = string
      s3files_volume_configuration = optional(object({
        access_point_arn        = optional(string)
        file_system_arn         = string
        root_directory          = optional(string)
        transit_encryption_port = optional(number)
      }))
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.ecs_task_definitions : (
        v.placement_constraints == null || (length(v.placement_constraints) <= 10)
      )
    ])
    error_message = "Each placement_constraints list must contain at most 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_task_definitions : (
        v.ephemeral_storage == null || (v.ephemeral_storage.size_in_gib >= 21 && v.ephemeral_storage.size_in_gib <= 200)
      )
    ])
    error_message = "must be between 21 and 200"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_task_definitions : (
        v.requires_compatibilities == null || (alltrue([for x in v.requires_compatibilities : contains(["EC2", "FARGATE", "EXTERNAL", "MANAGED_INSTANCES"], x)]))
      )
    ])
    error_message = "must be one of: EC2, FARGATE, EXTERNAL, MANAGED_INSTANCES"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_task_definitions : (
        v.volume == null || alltrue([for item in v.volume : (item.efs_volume_configuration == null || (item.efs_volume_configuration.transit_encryption_port == null || (item.efs_volume_configuration.transit_encryption_port >= 0 && item.efs_volume_configuration.transit_encryption_port <= 65535)))])
      )
    ])
    error_message = "must be a valid port number (0-65535)"
  }
  validation {
    condition = alltrue([
      for k, v in var.ecs_task_definitions : (
        v.volume == null || alltrue([for item in v.volume : (item.s3files_volume_configuration == null || (item.s3files_volume_configuration.transit_encryption_port == null || (item.s3files_volume_configuration.transit_encryption_port >= 0 && item.s3files_volume_configuration.transit_encryption_port <= 65535)))])
      )
    ])
    error_message = "must be a valid port number (0-65535)"
  }
  # Note: 17 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

