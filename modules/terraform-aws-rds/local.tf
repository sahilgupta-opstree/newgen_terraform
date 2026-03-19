locals {
  base_name = trim(var.program, "-")

  common_tags = var.tags

  rds_tags = merge(
    var.tags,
    {
      Customer-Code = var.rds_tags
    }
  )
}
