####################################
# VPC Configuration
####################################
variable "vpc_name" {
  type    = string
  default = ""
}

variable "vpc_cidr" {
  type    = string
}

variable "instance_tenancy" {
  type    = string
  default = "default"
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

####################################
# Internet Gateway
####################################
variable "create_igw_gateway" {
  type    = bool
  default = true
}

variable "internet_gateway_name" {
  type    = string
  default = ""
}

#############################
# Virtual gateway
#############################
variable "create_vgw" {
  type    = bool
  default = false
}

variable "vgw_name" {
  type    = string
  default = null
}

####################################
# Subnet Configuration
####################################
variable "subnet_names" {
  type = list(string)
}

variable "subnet_cidrs" {
  type = list(string)
}

variable "subnet_azs" {
  type = list(string)
}

####################################
# Route Tables (Multi-RT Support)
####################################
variable "route_table_names" {
  description = "List of route table names"
  type        = list(string)
  default     = []
}

variable "route_table_subnet_map" {
  description = "Map of route table name to subnet indexes"
  type        = map(list(number))
  default     = {}
}

variable "route_table_igw_cidr" {
  description = "CIDR for IGW route"
  type        = string
  default     = "0.0.0.0/0"
}

variable "endpoint_route_table_id" {
  description = "Route table ID to associate with the S3 Gateway VPC endpoint"
  type        = string
}

####################################
# NACL Configuration
####################################
variable "create_nacl" {
  type    = bool
  default = true
}

variable "nacl_names" {
  type    = list(string)
  default = []
}

variable "nacl_subnet_map" {
  description = "Map of NACL name to subnet indexes"
  type        = map(list(number))
  default     = {}
}

variable "nacl_allow_all" {
  description = "Allow all ingress and egress traffic in NACLs"
  type        = bool
  default     = true
}

variable "nacl_rules" {
  type    = any
  default = {}
}

####################################
# NAT Gateway
####################################
variable "create_nat_gateway" {
  type    = bool
  default = false
}

variable "nat_gateway_count" {
  type    = number
  default = 0
}

####################################
# Flow Logs
####################################
variable "flow_logs_enabled" {
  type    = bool
  default = false
}

variable "flow_logs_traffic_type" {
  type    = string
  default = "ALL"
}

variable "flow_logs_file_format" {
  type    = string
  default = "plain-text"
}

####################################
# Route53
####################################
variable "create_route53" {
  type    = bool
  default = false
}

variable "route53_zone" {
  type    = string
  default = ""
}

####################################
# VPC Endpoints
####################################
variable "enable_s3_endpoint" {
  type    = bool
  default = false
}

variable "vpc_endpoint_type" {
  description = "to assign the type of endpoint"
  type        = string
}

variable "name_vpc_endpoint" {
  description = "to assign the name of endpoint"
  type        = string
}

variable "service_name_s3" {
  type    = string
  default = "com.amazonaws.us-east-1.s3"
}


variable "s3_endpoint_type" {
  type    = string
  default = "Gateway"
}

variable "enable_ec2_endpoint" {
  type    = bool
  default = false
}

variable "service_name_ec2" {
  type    = string
  default = "com.amazonaws.us-east-1.ec2"
}

variable "ec2_endpoint_type" {
  type    = string
  default = "Interface"
}

variable "ec2_endpoint_subnet_type" {
  type    = string
  default = "public"
}

variable "ec2_private_dns_enabled" {
  type    = bool
  default = true
}

variable "enable_nlb_endpoint" {
  type    = bool
  default = false
}

variable "service_name_nlb" {
  type    = string
  default = "com.amazonaws.us-east-1.elb"
}

variable "nlb_endpoint_type" {
  type    = string
  default = "Interface"
}

variable "nlb_private_dns_enabled" {
  type    = bool
  default = false
}

####################################
# ALB & NLB
####################################
variable "create_alb" {
  type    = bool
  default = false
}

variable "internal" {
  type    = bool
  default = false
}

variable "enable_deletion_protection" {
  type    = bool
  default = false
}

variable "alb_certificate_arn" {
  type    = string
  default = ""
}

variable "access_logs" {
  type    = any
  default = {}
}

variable "create_nlb" {
  type    = bool
  default = false
}

variable "is_internal" {
  type    = bool
  default = false
}

####################################
# Security Groups
####################################
variable "enable_alb_sg" {
  type    = bool
  default = false
}

variable "enable_nlb_sg" {
  type    = bool
  default = false
}

variable "enable_endpoint_sg" {
  type    = bool
  default = false
}

####################################
# Security Group Rules
####################################
variable "alb_ingress_rules" {
  type    = list(any)
  default = []
}

variable "alb_egress_rules" {
  type    = list(any)
  default = []
}

variable "nlb_ingress_rules" {
  type    = list(any)
  default = []
}

variable "nlb_egress_rules" {
  type    = list(any)
  default = []
}

variable "endpoint_ingress_rules" {
  type    = list(any)
  default = []
}

variable "endpoint_egress_rules" {
  type    = list(any)
  default = []
}

####################################
# Key Pair
####################################
variable "create_key_pair" {
  type    = bool
  default = false
}

variable "create_private_key" {
  type    = bool
  default = false
}

variable "key_pair_name" {
  type    = string
  default = ""
}

variable "private_key_algorithm" {
  type    = string
  default = "RSA"
}

variable "private_key_rsa_bits" {
  type    = number
  default = 4096
}

variable "public_key_path" {
  type    = string
  default = ""
}

variable "key_output_dir" {
  type    = string
  default = "./keys"
}

####################################
# Metadata
####################################
variable "env" {
  type    = string
  default = ""
}

variable "program" {
  type    = string
  default = ""
}

variable "owner" {
  type    = string
  default = ""
}

variable "region" {
  type    = string
  default = "us-east-1"
}

variable "provisioner" {
  type    = string
  default = "terraform"
}

variable "tags" {
  type    = map(string)
  default = {}
}

####################################
# ALB Listeners
####################################
variable "alb_listeners" {
  type    = list(any)
  default = []
}
