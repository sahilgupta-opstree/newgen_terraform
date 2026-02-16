module "rds" {
  source = "/home/sahilgupta/OT-CLOUD-TF-MODULE/terraform-aws-rds"

  env                    = var.env
  app                    = var.app
  owner                  = var.owner

  vpc_id                 = var.vpc_id
  engine                 = var.engine
  engine_version         = var.engine_version
  cluster_identifier     = var.cluster_identifier
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [module.sg.sg_id]
  port                   = var.port
  master_username        = var.master_username
  master_password        = var.master_password
  deletion_protection    = var.deletion_protection
  storage_encrypted      = var.storage_encrypted
  skip_final_snapshot    = var.skip_final_snapshot
  instance_class         = var.instance_class
  cluster_instance_count = var.cluster_instance_count
  publicly_accessible    = var.publicly_accessible
  name_sg                = var.name_sg
}

module "sg" {
  source                              = "OT-CLOUD-KIT/security-groups/aws"
  version                             = "1.0.0"
  name_sg                             = var.name_sg
  tags                                = var.tags
  enable_whitelist_ip                 = true
  enable_source_security_group_entry  = true
  create_outbound_rule_with_src_sg_id = false

  vpc_id = data.terraform_remote_state.network.outputs.vpc_id
  ingress_rule = {
    rules = {
      rule_list = [
        {
          description  = "Allow port VPN"
          from_port    = 22
          to_port      = 22
          protocol     = "tcp"
          cidr         = ["10.0.0.0/18"]
          source_SG_ID = []
        }
      ]
    }
  }
}