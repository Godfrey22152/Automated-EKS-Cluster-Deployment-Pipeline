variable "vpc_id" {
  description = "The ID of the VPC"
  type        = string
}

variable "cluster_sg_name" {
  description = "Cluster Security Group Name" 
  type = string 
}

variable "node_sg_name" {
  description = "Node Security Group Name" 
  type = string  
}

variable "cluster_sg_name_tag" {
  description = "The name of the cluster security group"
  type        = string
}

variable "node_sg_name_tag" {
  description = "The name of the node security group"
  type        = string
}
