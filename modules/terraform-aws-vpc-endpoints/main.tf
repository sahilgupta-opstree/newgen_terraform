resource "aws_vpc_endpoint" "gateway" {
  for_each = local.gateway_endpoints

  vpc_id            = var.vpc_id
  service_name      = data.aws_vpc_endpoint_service.gateway[each.key].service_name
  vpc_endpoint_type = "Gateway"

  route_table_ids = [
    var.endpoint_route_table_id
  ]

  tags = {
    Name =  var.name_vpc_endpoint
  }
}

resource "aws_vpc_endpoint" "interface" {
  for_each = local.interface_endpoints

  vpc_id            = var.vpc_id
  service_name      = data.aws_vpc_endpoint_service.interface[each.key].service_name
  vpc_endpoint_type = "Interface"

  subnet_ids         = [var.interface_subnet_id]
  security_group_ids = [var.interface_sg_id]
  private_dns_enabled = true

  tags = {
    Name =  var.name_vpc_endpoint
  }
}