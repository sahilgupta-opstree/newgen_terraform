data "aws_subnets" "selected" {
  filter {
    name   = "tag:Name"
    values = var.subnet_names
  }
}

