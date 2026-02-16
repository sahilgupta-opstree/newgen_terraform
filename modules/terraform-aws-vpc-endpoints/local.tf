locals {
  gateway_endpoints = {
    s3 = "s3"
  }

  interface_endpoints = {
    ssm          = "ssm"
    ssmmessages  = "ssmmessages"
    ec2messages  = "ec2messages"
    ecr_api      = "ecr.api"
    ecr_dkr      = "ecr.dkr"
    codecommit   = "codecommit"
    ec2          = "ec2"
    sts          = "sts"
  }
}
