module "vpc" {
  source                  = "./modules/vpc"
  az                      = var.az
  cidr_block              = var.cidr_block
  cluster_name            = var.cluster_name
  enable_dns_hostnames    = var.enable_dns_hostnames
  enable_dns_support      = var.enable_dns_support
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_name                = var.vpc_name
}