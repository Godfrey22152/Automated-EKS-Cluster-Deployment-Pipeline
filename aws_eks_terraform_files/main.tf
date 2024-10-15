# main.tf
/*module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
  name        = var.bucket_name_tag
  environment = var.bucket_name
}*/

module "vpc" {
  source                  = "./modules/vpc"
  cidr_block              = var.cidr_block
  availability_zones      = var.availability_zones
  map_public_ip_on_launch = var.map_public_ip_on_launch
  vpc_name                = var.vpc_name
  subnet_name             = var.subnet_name
  igw_name                = var.igw_name
  route_table_name        = var.route_table_name
}

module "security_group" {
  source              = "./modules/security_group"
  vpc_id              = module.vpc.vpc_id
  cluster_sg_name     = var.cluster_sg_name
  node_sg_name        = var.node_group_name
  cluster_sg_name_tag = "odo-eks-cluster-sg"
  node_sg_name_tag    = "odo-eks-node-sg"

}

module "eks" {
  source                     = "./modules/eks"
  cluster_name               = var.cluster_name
  node_group_name            = var.node_group_name
  vpc_id                     = module.vpc.vpc_id
  subnet_ids                 = module.vpc.subnet_ids
  cluster_security_group_ids = [module.security_group.cluster_security_group_id]
  node_security_group_ids    = [module.security_group.node_security_group_id]
  ssh_key_name               = var.ssh_key_name
  desired_size               = var.desired_size
  max_size                   = var.max_size
  min_size                   = var.min_size
  instance_types             = var.instance_types
}