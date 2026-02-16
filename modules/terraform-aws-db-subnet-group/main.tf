data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name   = "tag:Name"
    values = var.subnet_names
  }
}

resource "aws_db_subnet_group" "this" {
  name       = trimspace(lower(var.db_subnet_group_name))
  subnet_ids = data.aws_subnets.selected.ids
  region     = var.region
}
