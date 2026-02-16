module "iam_role" {
  source = "git::https://github.com/sahilgupta-opstree/newgen_terraform.git//modules/terraform-aws-iam-role?ref=feature"

  region               = var.region
  roles                = var.roles
  custom_policies      = var.custom_policies
  assume_role_service  = var.assume_role_service
  env                  = var.env
  app                  = var.app
}
