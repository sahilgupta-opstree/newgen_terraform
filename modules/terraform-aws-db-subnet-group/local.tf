locals {
  base_name = trim(var.program, "-")

  common_tags = var.tags

  db_subnet_group_tags = merge(
    var.tags,
    {
      Customer-Code = var.db_subnet_group_tags
    }
  )
}
