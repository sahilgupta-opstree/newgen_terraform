terraform {
  backend "s3" {
    bucket = "newgen-tf-state-bucket"
    key    = "env/staging/network-skeleton/newgen/terraform.tfstate"
    region = "ap-south-1"
  }
} 