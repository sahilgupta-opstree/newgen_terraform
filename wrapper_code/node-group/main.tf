module "eks_nodegroup_dev" {
  source = "/home/sahilgupta/OT-CLOUD-TF-MODULE/terraform-aws-node-group"

  cluster_name             = var.cluster_name
  node_group_name          = var.node_group_name
  node_role_arn            = var.node_role_arn
  subnet_ids               = var.subnet_ids
  capacity_type            = var.capacity_type
  ami_type                 = var.ami_type
  desired_size             = var.desired_size
  min_size                 = var.min_size
  max_size                 = var.max_size
  launch_template_id       = var.launch_template_id
  launch_template_version  = var.launch_template_version
  tags                     = var.tags
  nodegroup_role_name      = var.nodegroup_role_name
  

}
