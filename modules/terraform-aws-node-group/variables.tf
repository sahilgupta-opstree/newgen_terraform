variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster this node group belongs to"
}

variable "node_group_name" {
  type        = string
  description = "Name of the node group"
}

variable "node_role_arn" {
  type        = string
  description = "ARN of the IAM role for the node group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnets where the node group will be deployed"
}

variable "capacity_type" {
  type        = string
  description = "Capacity type for the node group (ON_DEMAND or SPOT)"
  default     = "ON_DEMAND"
}

variable "ami_type" {
  type        = string
  description = "AMI type for the node group (AL2_x86_64, etc.)"
  default     = "AL2_x86_64"
}

variable "desired_size" {
  type        = number
  description = "Desired number of nodes"
}

variable "min_size" {
  type        = number
  description = "Minimum number of nodes"
}

variable "max_size" {
  type        = number
  description = "Maximum number of nodes"
}

variable "launch_template_id" {
  type        = string
  description = "ID of the launch template to use"
}

variable "launch_template_version" {
  type        = string
  description = "Version of the launch template (use '$Latest' or specific version)"
  default     = "$Latest"
}

variable "tags" {
  type        = map(string)
  description = "Optional tags for node group"
  default     = {}
}

variable "nodegroup_role_name" {
  type        = string
  description = "IAM role name for EKS node group"
}

