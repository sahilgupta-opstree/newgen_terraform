data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "newgen-tf-state-bucket"
    key    = "env/staging/network-skeleton/newgen/terraform.tfstate"
    region = "ap-south-1"
  }
}