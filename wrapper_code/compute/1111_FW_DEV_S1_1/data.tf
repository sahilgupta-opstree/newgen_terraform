data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "newgen-tf-state-bucket"
    key    = "env/staging/network-skeleton/newgen/terraform.tfstate"
    region = "ap-south-1"
  }
}


data "aws_route_tables" "private_rts" {
  filter {
    name   = "tag:Name"
    values = var.private_route_table_names
  }
}
