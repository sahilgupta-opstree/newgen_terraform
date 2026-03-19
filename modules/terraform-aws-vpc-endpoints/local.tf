locals {
  vpc_endpoint_tags = merge(
    var.tags,
    {
      Customer-Code = var.vpc_endpoint_tags
    }
  )
}
