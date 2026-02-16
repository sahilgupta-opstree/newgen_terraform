variable "region" {
  type        = string
  description = "AWS region"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "node_group_name" {
  type        = string
  description = "EKS node group name"
}

variable "node_role_arn" {
  type        = string
  description = "IAM role ARN for node group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs where node group will deploy"
}

variable "capacity_type" {
  type        = string
  description = "ON_DEMAND or SPOT"
  default     = "ON_DEMAND"
}

variable "ami_type" {
  type        = string
  description = "AMI type"
  default     = "AL2_x86_64"
}

variable "desired_size" {
  type        = number
  description = "Desired node count"
}

variable "min_size" {
  type        = number
  description = "Minimum node count"
}

variable "max_size" {
  type        = number
  description = "Maximum node count"
}

variable "launch_template_id" {
  type        = string
  description = "Launch template ID for node group"
}

variable "launch_template_version" {
  type        = string
  description = "Launch template version (default $Latest)"
  default     = "$Latest"
}

variable "tags" {
  type        = map(string)
  description = "Optional tags"
  default     = {}
}

variable "nodegroup_role_name" {
  type = string
}

