resource "aws_launch_template" "template" {
  region        = var.region
  name_prefix   = var.name_prefix
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name
  metadata_options {
    http_tokens   = var.metadata_http_tokens
    http_endpoint = "enabled"
  }

  block_device_mappings {
    device_name = var.volume_device_name

    ebs {
      volume_size           = var.volume_size
      volume_type           = var.volume_type
      delete_on_termination = var.delete_on_termination
      encrypted             = var.encrypted
      throughput            = var.throughput
    }
  }
}
