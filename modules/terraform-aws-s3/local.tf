locals {
  create_bucket     = var.create_bucket
  create_bucket_acl = var.acl != null && var.acl != "null"
  attach_policy     = var.attach_elb_log_delivery_policy || var.attach_lb_log_delivery_policy || var.attach_iam_policy || var.attach_cloudtrail_policy
  cors_rules        = var.cors_rules

  s3_bucket_tags = merge(
    var.tags,
    {
      Customer-Code = var.s3_tags
    }
  )
}
