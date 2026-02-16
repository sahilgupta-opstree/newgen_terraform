terraform {
  backend "s3" {
    bucket = "newgen-tf-state-bucket"
    key    = "env/staging/compute/1111_FW_DEV_S1_1/terraform.tfstate"
    region = "ap-south-1"
  }
}