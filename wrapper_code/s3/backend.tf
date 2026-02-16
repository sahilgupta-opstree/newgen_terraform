terraform {
  backend "s3" {
    bucket = "newgen-tf-state-bucket"
    key    = "env/staging/S3/terraform.tfstate"
    region = "ap-south-1"
  }
}