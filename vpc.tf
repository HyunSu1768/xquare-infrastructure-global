locals {
  azs             = ["${data.aws_region.current.name}a", "${data.aws_region.current.name}c"]
  public_subnets  = ["10.0.0.0/20", "10.0.16.0/20"]
  private_subnets = ["10.0.128.0/20", "10.0.144.0/20"]
  vpc_cidr        = "10.0.0.0/16"
  cluster_name    = "${local.name_prefix}-cluster"
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr        = local.vpc_cidr
  azs             = local.azs
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets
  name_prefix     = local.name_prefix
  cluster_name    = local.cluster_name
}
