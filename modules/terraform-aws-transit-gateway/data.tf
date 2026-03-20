data "aws_ec2_transit_gateway" "existing_tgw" {
  transit_gateway_id = var.tg_id
}