module "iam_role" {
  source = "/home/sahilgupta/OT-CLOUD-TF-MODULE/terraform-aws-iam-role"

  region               = var.region
  roles                = var.roles
  custom_policies      = var.custom_policies
  assume_role_service  = var.assume_role_service
  env                  = var.env
  app                  = var.app
}