locals {
  base_name = trim(var.program, "-")

  common_tags = var.tags

  ec2_tags = merge(
    var.tags,
    {
      Customer-Code = var.ec2_tags
    }
  )

  ebs_tags = merge(
    var.tags,
    {
      Project = var.ebs_tags
    }
  )

  sg_tags = merge(
    var.tags,
    {
      CC = var.sg_tags
    }
  )

  eip_tags = merge(
    var.tags,
    {
      CC-Project = var.eip_tags
    }
  )
}
