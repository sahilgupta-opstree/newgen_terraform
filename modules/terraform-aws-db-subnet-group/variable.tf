variable "region" {
  type = string
}

variable "db_subnet_group_name" {
  type = string
}

# variable "db_subnet_ids" {
#   type = list(string)
# }

variable "subnet_names" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}
