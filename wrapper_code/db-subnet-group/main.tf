module "db_subnet_group" {
  source = "/home/sahilgupta/OT-CLOUD-TF-MODULE/terraform-aws-db-subnet-group"

  db_subnet_group_name = var.db_subnet_group_name
  subnet_names         = var.subnet_names
  region               = var.region
  vpc_id               = var.vpc_id
}
