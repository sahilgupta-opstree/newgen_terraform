variable "s3_buckets" {
  type = map(object({
    name        = string
    force_destroy = bool
    control_object_ownership = bool
    object_ownership = string
    attach_public_policy = bool
    block_public_acls = bool
    block_public_policy = bool
    ignore_public_acls = bool
    restrict_public_buckets = bool
    versioning = object({
      enabled    = bool
      status     = string
      mfa_delete = bool
    })
    server_side_encryption_configuration = list(object({
      bucket_key_enabled = bool
      apply_server_side_encryption_by_default = object({
        sse_algorithm     = string
        kms_master_key_id = optional(string)
      })
    }))
    tags = map(string)
  }))
}

variable "env" {
  type = string
}

variable "app" {
  type = string
}

variable "region" {
  type = string
}

variable "replication_destination_bucket" {
  description = "Map of S3 bucket names to be used as replication destinations for each source bucket"
  type = map(string)
  default = {
    alb_log = ""
    app     = ""
    log     = ""
  }
}

variable "replication_destination_arn" {
  description = "Destination bucket ARN for CRR"
  type        = string
  default     = "*"
}