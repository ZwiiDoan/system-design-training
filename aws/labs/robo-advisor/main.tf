module "vpc" {
  source = "./modules/vpc"

  project_name               = local.project_name
  vpc_cidr_block             = var.vpc_cidr_block
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  default_tags               = local.default_tags
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnet_ids
  default_tags   = local.default_tags
}

module "asg" {
  source                     = "./modules/asg"
  vpc_id                     = module.vpc.vpc_id
  private_subnets            = module.vpc.private_subnet_ids
  instance_type              = var.instance_type
  default_tags               = local.default_tags
  instance_security_group_id = module.alb.instance_security_group_id
  target_group_arn           = module.alb.target_group_arn
}
