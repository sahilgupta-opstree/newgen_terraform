output "vpc_attachment_ids" {
  value = { for k, v in aws_ec2_transit_gateway_vpc_attachment.tgw_attachment : k => v.id }
}

output "vpc_id" {
  value       = aws_ec2_transit_gateway_vpc_attachment.tgw_attachment.id
  description = "ID of the OTMS VPC"
}