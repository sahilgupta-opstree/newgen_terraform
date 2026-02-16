module "endpoints" {
  source   = "/home/sahilgupta/OT-CLOUD-TF-MODULE/terraform-aws-vpc-endpoints"

  vpc_id         = var.vpc_id
  name_vpc_endpoint = var.name_vpc_endpoint
  endpoint_route_table_id = var.endpoint_route_table_id
  interface_subnet_id = var.interface_subnet_id
   interface_sg_id = module.sg.sg_id
}

module "sg" {
  source  = "OT-CLOUD-KIT/security-groups/aws"
  version = "1.0.0"

  name_sg = var.sg_name
  tags    = var.tags
  vpc_id  = var.vpc_id

  enable_whitelist_ip                 = true
  enable_source_security_group_entry  = true
  create_outbound_rule_with_src_sg_id = false

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
