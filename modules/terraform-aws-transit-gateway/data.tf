data "aws_ec2_transit_gateway" "existing_tgw" {
  filter {
    arn = var.tg_arn
  }
}