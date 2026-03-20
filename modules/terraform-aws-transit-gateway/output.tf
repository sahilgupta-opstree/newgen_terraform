output "vpc_attachment_ids" {
  value = { for k, v in aws_ec2_transit_gateway_vpc_attachment.tgw_attachment : k => v.id }
}

output "aws_ec2_transit_gateway_vpc_attachment" {
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment[each.key].id
  description = "ID of the aws_ec2_transit_gateway_vpc_attachment"
}