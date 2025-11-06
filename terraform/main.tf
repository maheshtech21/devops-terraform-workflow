module "vpc" {
  source = "./modules/vpc"
  project_name          = var.project_name
  vpc_cidr              = var.vpc_cidr
  public_subnet_cidrs   = var.public_subnet_cidrs
  private_subnet_cidrs  = var.private_subnet_cidrs
}

module "security_groups" {
  source  = "./modules/sg"
  project_name = var.project_name
  vpc_id       = module.vpc.vpc_id
}

module "s3_iam" {
  source       = "./modules/s3"
  project_name = var.project_name
}

module "ec2" {
  source                = "./modules/ec2"
  project_name          = var.project_name
  ami_id                = var.ami_id
  instance_type         = var.instance_type
  public_subnet_id      = module.vpc.public_subnets[0]
  private_subnet_id     = module.vpc.private_subnets[0]
  public_sg_id          = module.security_groups.public_sg_id
  app_sg_id             = module.security_groups.app_sg_id
  aws_key_pair          = var.aws_key_pair
  iam_instance_profile  = module.s3_iam.iam_instance_profile
}

module "alb" {
  source          = "./modules/alb"
  project_name    = var.project_name
  vpc_id          = module.vpc.vpc_id
  public_subnets  = module.vpc.public_subnets
  app_instance_id = module.ec2.app_instance_id
  app_sg_id       = module.security_groups.app_sg_id
}
