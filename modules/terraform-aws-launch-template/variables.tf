variable "region" {
  type = string
}

variable "name_prefix" {
  type        = string
  description = "Launch template name prefix"
}

variable "image_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "Key pair name for EC2"
}

variable "metadata_http_tokens" {
  type        = string
  description = "Metadata version (required: optional | required)"
  default     = "required"  # for both V1 & V2, set to required
}

variable "volume_device_name" {
  type        = string
  description = "EBS device name"
  default     = "/dev/xvda"
}

variable "volume_size" {
  type        = number
  description = "Volume size in GB"
  default     = 100
}

variable "delete_on_termination" {
  type        = bool
  description = "Delete volume on instance termination"
  default     = true
}

variable "volume_type" {
  type        = string
  description = "Volume type"
  default     = "gp3"
}

variable "encrypted" {
  type        = bool
  description = "Enable volume encryption"
  default     = true
}

variable "throughput" {
  type        = number
  description = "Throughput for gp3 volumes in MB/s"
  default     = 128
}
