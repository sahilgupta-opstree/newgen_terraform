resource "aws_instance" "ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet
  associate_public_ip_address = var.public_ip
  key_name                    = var.key_name
  vpc_security_group_ids      = var.security_groups
  iam_instance_profile        = var.iam_instance_profile

  disable_api_termination     = var.termination_protection

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.volume_type
    encrypted   = var.encrypted_volume
    throughput  = var.volume_type == "gp3" ? var.volume_throughput : null
  }

  tags = {
    Name = var.ec2_name
  }
}

resource "aws_ebs_volume" "volume_d" {
  count = var.enable_volume_d ? 1 : 0

  availability_zone = aws_instance.ec2.availability_zone
  size              = var.volume_size
  type              = var.volume_type
  encrypted         = var.encrypted_volume
  throughput        = var.volume_type == "gp3" ? var.volume_throughput : null

  tags = {
    Name = "${var.ec2_name}-D"
  }
}


resource "aws_volume_attachment" "volume_d_attach" {
  count = var.enable_volume_d ? 1 : 0

  device_name = var.volume_d_device_name
  volume_id   = aws_ebs_volume.volume_d[0].id
  instance_id = aws_instance.ec2.id
}



resource "aws_ebs_volume" "volume_e" {
  count = var.enable_volume_e ? 1 : 0

  availability_zone = aws_instance.ec2.availability_zone
  size              = var.volume_e_size
  type              = var.volume_e_type
  encrypted         = var.encrypted_volume

  tags = merge(
    var.tags,
    {
      Name = "${var.ec2_name}-volume-e"
    }
  )
}

resource "aws_volume_attachment" "volume_e_attach" {
  count = var.enable_volume_e ? 1 : 0

  device_name = var.volume_e_device_name
  volume_id   = aws_ebs_volume.volume_e[0].id
  instance_id = aws_instance.ec2.id
}

resource "aws_iam_role" "ec2_role" {
  name = "${var.ec2_name}-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume.json
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = var.iam_instance_profile
  role = aws_iam_role.ec2_role.name
}