variable "vpc_id" {
  description = "VPC ID jisme endpoints create karne hain"
  type        = string
}

variable "endpoint_route_table_id" {
  description = "Route table ID to associate with the S3 Gateway VPC endpoint"
  type        = string
}

variable "interface_subnet_id" {
  description = "Route table ID to associate with the S3 Gateway VPC endpoint"
  type        = string
}

variable "interface_sg_id" {
  description = "Route table ID to associate with the S3 Gateway VPC endpoint"
  type        = string
}

variable "endpoint_type" {
  type    = string
  default = ""
}

variable "name_vpc_endpoint" {
  description = "to assign the name of endpoint"
  type        = string
}

variable "region" {
  type    = string
}

variable "sg_name" {
  description = "Name of the security group"
  type        = string
}

variable "tags" {
  description = "Additional tags for the EC2 instances"
  type        = map(string)
  default     = {}
}