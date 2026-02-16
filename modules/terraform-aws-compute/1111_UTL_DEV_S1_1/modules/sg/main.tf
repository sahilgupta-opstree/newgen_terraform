resource "aws_security_group" "security_group" {
  for_each = toset(var.sg_name)

  name   = each.value
  vpc_id = var.vpc_id

  tags = merge(
    {
      Name        = each.value
      Provisioner = var.provisioner
    },
    var.tags
  )
}


resource "aws_security_group_rule" "with_cidr_blocks" {
  for_each = {
    for i, r in local.ingress_cidr_rules : i => r
  }

  type              = var.type_ingress_rule
  description       = each.value.description
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr
  security_group_id = each.value.sg_id
}


locals {
  ingress_cidr_rules = flatten([
    for sg_key, sg in aws_security_group.security_group : [
      for rule in var.ingress_rule.rules.rule_list : {
        sg_id       = sg.id
        description = rule.description
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr        = rule.cidr
      }
    ]
  ])

  ingress_sg_rules = flatten([
    for sg_key, sg in aws_security_group.security_group : [
      for rule in var.ingress_rule.rules.rule_list : [
        for source_sg in rule.source_SG_ID : {
          sg_id       = sg.id
          description = rule.description
          from_port   = rule.from_port
          to_port     = rule.to_port
          protocol    = rule.protocol
          source_sg   = source_sg
        }
      ]
    ]
  ])

  egress_cidr_rules = flatten([
    for sg_key, sg in aws_security_group.security_group : [
      for rule in var.egress_rule.rules.rule_list : {
        sg_id       = sg.id
        description = rule.description
        from_port   = rule.from_port
        to_port     = rule.to_port
        protocol    = rule.protocol
        cidr        = rule.cidr
      }
    ]
  ])
}

resource "aws_security_group_rule" "sg_egress_with_cidr" {
  for_each = {
    for i, r in local.egress_cidr_rules : i => r
  }

  type              = var.type_egress_rule
  description       = each.value.description
  from_port         = each.value.from_port
  to_port           = each.value.to_port
  protocol          = each.value.protocol
  cidr_blocks       = each.value.cidr
  security_group_id = each.value.sg_id
}


resource "aws_security_group_rule" "with_source_sg" {
  for_each = {
    for i, r in local.ingress_sg_rules : i => r
  }

  type                     = var.type_ingress_rule
  description              = each.value.description
  from_port                = each.value.from_port
  to_port                  = each.value.to_port
  protocol                 = each.value.protocol
  source_security_group_id = each.value.source_sg
  security_group_id        = each.value.sg_id
}


