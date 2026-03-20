data "aws_ec2_transit_gateway" "existing_tgw" {
  arn = var.tgw_arn
}