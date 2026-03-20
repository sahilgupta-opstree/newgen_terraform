resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment" {
  for_each = { for vpc in var.vpc_attachments : vpc.name => vpc }

  subnet_ids         = each.value.subnet_ids
  transit_gateway_id = var.tgw_arn
  vpc_id             = each.value.vpc_id

  dns_support                            = each.value.dns_support
  ipv6_support                           = each.value.ipv6_support
  transit_gateway_default_route_table_association = each.value.associate_with_tgw_route_table
  transit_gateway_default_route_table_propagation = each.value.propagate_to_tgw_route_table

#     tags = merge(
#     {
#       Name = "${local.base_name}-${each.value.name}-tgw-attach"
#     },
#     local.common_tags
#   )

 }

resource "aws_route" "tgw_routes" {
  for_each = { for vpc in var.vpc_attachments : vpc.name => vpc if vpc.route_table_id != null }

  route_table_id         = each.value.route_table_id
  destination_cidr_block = var.tgw_route_cidr_block
  transit_gateway_id     = aws_ec2_transit_gateway.tgw.id

  # Ensures TGW and all attachments are created before adding the route
  depends_on = [
    aws_ec2_transit_gateway.tgw,
    aws_ec2_transit_gateway_vpc_attachment.tgw_attachment
  ]
}
