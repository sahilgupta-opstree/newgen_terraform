resource "aws_instance" "ec2" {
  count = var.count_ec2_instance

  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet
  associate_public_ip_address = var.public_ip
  key_name                    = var.key_name
  vpc_security_group_ids      = var.security_groups
  iam_instance_profile        = var.iam_instance_profile
  disable_api_termination     = var.termination_protection
  source_dest_check           = false


  # Root volume (C:)
  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
    encrypted   = var.encrypted_volume
    throughput  = var.volume_type == "gp3" ? var.volume_throughput : null
  }

  tags = merge(
    {
      Name        = "${var.ec2_name}-${count.index}"
      PROVISIONER = "Terraform"
    },
    var.tags
  )
}



resource "aws_iam_role" "ec2_role" {
  name = "devops-linux-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.iam_instance_profile
  role = aws_iam_role.ec2_role.name
}


resource "aws_route" "private_default_to_firewall" {
  for_each = toset(var.private_route_table_names)

  route_table_id         = each.value
  destination_cidr_block = "0.0.0.0/0"
  network_interface_id = aws_instance.ec2[0].primary_network_interface_id
}





