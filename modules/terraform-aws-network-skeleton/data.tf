# data "aws_vpc_endpoint_service" "gateway" {
#   for_each     = local.gateway_endpoints
#   service      = each.key      
#   service_type = "Gateway"
# }

# data "aws_vpc_endpoint_service" "interface" {
#   for_each     = local.interface_endpoints
#   service_name = each.value
# }



