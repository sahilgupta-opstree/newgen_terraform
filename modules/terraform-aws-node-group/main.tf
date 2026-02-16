resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids
  capacity_type   = var.capacity_type
  ami_type        = var.ami_type

  scaling_config {
    desired_size = var.desired_size
    min_size     = var.min_size
    max_size     = var.max_size
  }

  launch_template {
    id      = var.launch_template_id
    version = var.launch_template_version
  }

  # Optional tags
  tags = var.tags
}

# resource "aws_iam_role" "eks_nodegroup_role" {
#   name = var.nodegroup_role_name

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#         Action = "sts:AssumeRole"
#       }
#     ]
#   })

#   tags = var.tags
# }

# resource "aws_iam_role_policy_attachment" "worker_node_policy" {
#   role       = aws_iam_role.eks_nodegroup_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
# }

# resource "aws_iam_role_policy_attachment" "cni_policy" {
#   role       = aws_iam_role.eks_nodegroup_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
# }

# resource "aws_iam_role_policy_attachment" "ecr_readonly_policy" {
#   role       = aws_iam_role.eks_nodegroup_role.name
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
# }

