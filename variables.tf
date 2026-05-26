variable "family" {
  description = "ElastiCache parameter group family (e.g., redis7)"
  type        = string
  default     = "redis7"
}

variable "parameters" {
  description = "List of ElastiCache parameters"
  type = list(object({
    name  = string
    value = string
  }))
  default = []
}

variable "description" {
  description = "Description of the parameter group"
  type        = string
  default     = null
}
