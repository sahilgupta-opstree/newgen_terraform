terraform {
  backend "s3" {
    bucket = "newgen-tf-state-bucket"
    key    = "env/staging/vpc-endpoint/terraform.tfstate"
    region = "ap-south-1"
  }
}