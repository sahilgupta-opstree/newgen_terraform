terraform {
  backend "s3" {
    bucket = "newgen-tf-state-bucket"
    key    = "env/staging/IAM-Roles/terraform.tfstate"
    region = "ap-south-1"
  }
}