
/*module "s3" {
  source      = "./s3"
  bucket_name = var.bucket_name
  name        = var.bucket_name_tag
  environment = var.bucket_name
}*/

module "vpc" {
  source               = "./vpc"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  cidr_public_subnet   = var.cidr_public_subnet
  eu_availability_zone = var.eu_availability_zone
}

module "security_group" {
  source              = "./security-groups"
  dev_project_sg_name = "Jenkins-Server-SG"
  Name_tag            = "DevOps-Jenkins-Server-SG"
  vpc_id              = module.vpc.dev_project_vpc_id
}

module "jenkins_ec2_server" {
  source                    = "./jenkins_server"
  ami_id                    = var.ec2_ami_id
  instance_type             = "t2.medium"
  tag_name                  = "Jenkins:Ubuntu Linux EC2"
  jenkins_public_key        = var.jenkins_public_key
  subnet_id                 = tolist(module.vpc.dev_project_public_subnets)[0]
  dev_project_sg            = [module.security_group.dev_project_sg_id]
  enable_public_ip_address  = true
  user_data_install_jenkins = file("jenkins-installer.sh")
}
