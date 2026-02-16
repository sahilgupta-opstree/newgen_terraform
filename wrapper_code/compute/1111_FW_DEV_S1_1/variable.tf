variable "region" {
  type        = string
  description = "Region where resource will be created."
}

variable "key_name" {
  description = "Name of the key pair to associate with the EC2 instances"
  type        = string
  default     = ""
}


variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 1
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
  default     = ""
}

variable "public_ip" {
  description = "Whether to assign a public IP address to the EC2 instances"
  type        = bool
  default     = false
}


variable "volume_size" {
  description = "Size of the root volume for the EC2 instances (in GB)"
  type        = number
  default     = 100
}

variable "volume_type" {
  description = "Type of the root volume for the EC2 instances"
  type        = string
  default     = "gp2"
}

variable "encrypted_volume" {
  description = "Whether the root volume should be encrypted"
  type        = bool
  default     = false
}

variable "iam_instance_profile" {
  type = string
  default = ""
}

variable "ec2_name" {
  description = "Name for the EC2 instances"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags for the EC2 instances"
  type        = map(string)
  default     = {}
}
variable "sg_name" {
  description = "Name of the security group"
  type        = string
}


variable "attach_iam_role" {
  type    = bool
  default = false
}

variable "termination_protection" {
  description = "Enable termination protection for EC2"
  type        = bool
  default     = false
}

variable "volume_throughput" {
  description = "EBS volume throughput in MB/s (gp3 only)"
  type        = number
  default     = 0
}

variable "private_route_table_names" {
  type = list(string)
}
