resource "aws_route" "tgw_routes" {
  for_each = { for vpc in var.vpc_attachments : vpc.name => vpc if vpc.route_table_id != null }

  route_table_id         = each.value.route_table_id
  destination_cidr_block = var.tgw_route_cidr_block
  transit_gateway_id     = data.aws_ec2_transit_gateway.existing_tgw.id

  # Ensures TGW and all attachments are created before adding the route
  depends_on = [
    aws_ec2_transit_gateway_vpc_attachment.tgw_attachment
  ]
}
