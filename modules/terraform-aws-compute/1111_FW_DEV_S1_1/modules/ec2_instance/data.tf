data "aws_iam_policy_document" "ec2_assume" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

# resource "aws_route" "private_default_routes" {
#   for_each = toset(var.fw_route_table_ids)

#   route_table_id         = each.value
#   destination_cidr_block = "0.0.0.0/0"
#   network_interface_id   = aws_instance.ec2[0].primary_network_interface_id
# }

