
bucket_name = "eks-cluster-remote-state-bucket-22152"
name        = "environment"
environment = "dev"

vpc_cidr             = "11.0.0.0/16"
vpc_name             = "DevOps-Jenkins-Server-VPC"
cidr_public_subnet   = ["11.0.1.0/24", "11.0.2.0/24"]
eu_availability_zone = ["eu-west-1a", "eu-west-1b"]

jenkins_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB0gS81clPD18J2bgZCHzriQbx53soRoFh9WfFaMCHza Jenkins-KeyPair"
ec2_ami_id         = "ami-03cc8375791cb8bcf"

