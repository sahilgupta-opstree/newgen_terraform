output "sg_ids" {
  value = [for sg in aws_security_group.security_group : sg.id]
}

output "sg_arns" {
  value = [for sg in aws_security_group.security_group : sg.arn]
}
