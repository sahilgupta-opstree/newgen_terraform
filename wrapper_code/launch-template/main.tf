module "launch_template_dev" {
  source = "/home/sahilgupta/OT-CLOUD-TF-MODULE/terraform-aws-launch-template"
  
  region                 = var.region
  name_prefix            = var.name_prefix
  image_id               = var.image_id 
  instance_type          = var.instance_type
  key_name               = var.key_name
  metadata_http_tokens   = var.metadata_http_tokens
  volume_device_name     = var.volume_device_name
  volume_size            = var.volume_size
  delete_on_termination  = var.delete_on_termination
  volume_type            = var.volume_type
  encrypted              = var.encrypted
  throughput             = var.throughput
}
