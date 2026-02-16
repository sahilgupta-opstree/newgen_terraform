module "s3" {
  for_each = var.s3_buckets
  source   = "/home/sahilgupta/OT-CLOUD-TF-MODULE/terraform-aws-s3"

  create_bucket                          = true
  name                                   = each.value.name
  force_destroy                           = each.value.force_destroy
  control_object_ownership               = each.value.control_object_ownership
  object_ownership                        = each.value.object_ownership
  attach_public_policy                     = each.value.attach_public_policy
  block_public_acls                        = each.value.block_public_acls
  block_public_policy                      = each.value.block_public_policy
  ignore_public_acls                        = each.value.ignore_public_acls
  restrict_public_buckets                   = each.value.restrict_public_buckets
  versioning                               = each.value.versioning
  server_side_encryption_configuration     = each.value.server_side_encryption_configuration
  tags                                     = each.value.tags

  env = var.env
  app = var.app
}
