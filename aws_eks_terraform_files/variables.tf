# S3 Variables
variable "bucket_name" {
  type        = string
  description = "Remote state bucket name"
}

variable "bucket_name_tag" {
  type        = string
  description = "Tag name"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

# VPC variables
variable "aws_region" {
  description = "AWS Region"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name tag for the VPC"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
}

variable "map_public_ip_on_launch" {
  description = "Whether to map public IPs on launch"
  type        = bool
  default     = true
}

variable "subnet_name" {
  description = "The name tag for subnets"
  type        = string
}

variable "igw_name" {
  description = "The name tag for the Internet Gateway"
  type        = string
}

variable "route_table_name" {
  description = "The name tag for the Route Table"
  type        = string
}

#SG Variables 
variable "cluster_sg_name" {
  description = "Name of the EKS cluster Security Group "
  type        = string
}

variable "node_sg_name" {
  description = "Name of the EKS Node Security Group"
  type        = string
}

#EKS Variables
variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "desired_size" {
  description = "Desired number of nodes in the EKS node group"
  type        = number
}

variable "max_size" {
  description = "Maximum number of nodes in the EKS node group"
  type        = number
}

variable "min_size" {
  description = "Minimum number of nodes in the EKS node group"
  type        = number
}

variable "instance_types" {
  description = "List of instance types for the EKS nodes"
  type        = list(string)
}

variable "ssh_key_name" {
  description = "Name of the SSH key pair"
  type        = string
}
