terraform {
  backend "s3" {
    bucket = "newgen-tf-state-bucket"
    key    = "env/staging/RDS/terraform.tfstate"
    region = "ap-south-1"
  }
}