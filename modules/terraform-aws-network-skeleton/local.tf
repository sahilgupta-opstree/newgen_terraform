locals {
  base_name = "${trim(var.env, "-")}-${trim(var.program, "-")}"

  common_tags = {
    env   = var.env
    owner = var.owner
  }

  subnets = [
    for i in range(length(var.subnet_names)) : {
      name = var.subnet_names[i]
# name  = "${var.env}-${var.program}-${var.subnet_names[i]}"
      cidr  = var.subnet_cidrs[i]
      az    = var.subnet_azs[i]
      index = i
    }
  ]

  subnet_ids_by_index = {
    for i, s in aws_subnet.subnets :
    i => s.id
  }

  # Single source of truth
  all_subnet_ids = aws_subnet.subnets[*].id

  application_subnet_ids = [
    for i, subnet in aws_subnet.subnets :
    subnet.id if can(regex("(?i)application", var.subnet_names[i]))
  ]

  database_subnet_ids = [
    for i, subnet in aws_subnet.subnets :
    subnet.id if can(regex("(?i)database", var.subnet_names[i]))
  ]

  selected_subnet_ids = (
    var.ec2_endpoint_type == "Interface" ? local.all_subnet_ids : null
  )
}



#################### NACL ########################

# locals {
#   nacls = {
#     for i in range(length(var.nacl_names)) :
#     var.nacl_names[i] => "${var.env}-${var.nacl_names[i]}-nacl"
#   }

#   nacl_config = {
#     for nacl_key, nacl_value in var.nacl_rules :
#     nacl_key => {
#       name       = local.nacls[nacl_key]
#       subnet_ids = [for index in nacl_value.subnet_index : aws_subnet.subnets[index].id]
#       ingress    = nacl_value.ingress_rules
#       egress     = nacl_value.egress_rules
#     }
#   }
# }

locals {
  nacl_config = {
    for name, subnet_indexes in var.nacl_subnet_map :
    name => {
      name       = name
      subnet_ids = [for i in subnet_indexes : local.subnet_ids_by_index[i]]

      ingress = [
        {
          rule_no    = 100
          protocol   = "-1"
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 0
          to_port    = 0
        }
      ]

      egress = [
        {
          rule_no    = 100
          protocol   = "-1"
          action     = "allow"
          cidr_block = "0.0.0.0/0"
          from_port  = 0
          to_port    = 0
        }
      ]
    }
  }
}


################### ROUTE TABLE #######################

locals {
  route_tables = {
    for name, subnet_indexes in var.route_table_subnet_map :
    name => {
      name       = name
      subnet_ids = [for i in subnet_indexes : local.subnet_ids_by_index[i]]
    }
  }
}

locals {
  route_table_associations = flatten([
    for rt_name, subnet_indexes in var.route_table_subnet_map : [
      for subnet_index in subnet_indexes : {
        rt_name      = rt_name
        subnet_index = subnet_index
      }
    ]
  ])
}

# locals {
#   gateway_endpoints = {
#     s3 = "com.amazonaws.ap-southeast-1.s3"
#   }
  
# }

# locals {
#   s3_gateway_rt_key = var.endpoint_route_table_id # jo key tumhare local.route_tables me hai
# }

# locals {
#   interface_endpoints = {
#     ec2          = "com.amazonaws.ap-southeast-1.ec2"
#     ecr_dkr      = "com.amazonaws.ap-southeast-1.ecr.dkr"
#     ecr_api      = "com.amazonaws.ap-southeast-1.ecr.api"
#     sts          = "com.amazonaws.ap-southeast-1.sts"
#     ssm          = "com.amazonaws.ap-southeast-1.ssm"
#     ssmmessages  = "com.amazonaws.ap-southeast-1.ssmmessages"
#     ec2messages  = "com.amazonaws.ap-southeast-1.ec2messages"
#     codecommit   = "com.amazonaws.ap-southeast-1.codecommit"
#   }
# }