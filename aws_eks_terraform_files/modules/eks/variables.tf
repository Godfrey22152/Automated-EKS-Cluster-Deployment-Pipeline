variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "Name of the EKS node group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the EKS cluster is deployed"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "cluster_security_group_ids" {
  description = "Security group IDs for the EKS cluster"
  type        = list(string)
}

variable "node_security_group_ids" {
  description = "Security group IDs for the EKS node group"
  type        = list(string)
}

variable "cluster_role_name" {
  description = "IAM role name for EKS cluster"
  type        = string
  default     = "odo-eks-cluster-role"
}

variable "node_group_role_name" {
  description = "IAM role name for EKS node group"
  type        = string
  default     = "odo-eks-node-group-role"
}

variable "ssh_key_name" {
  description = "SSH key name for remote access to the nodes"
  type        = string
}

variable "desired_size" {
  description = "Desired size of the node group"
  type        = number
  default     = 3
}

variable "max_size" {
  description = "Maximum size of the node group"
  type        = number
  default     = 3
}

variable "min_size" {
  description = "Minimum size of the node group"
  type        = number
  default     = 3
}

variable "instance_types" {
  description = "Instance types for the node group"
  type        = list(string)
  default     = ["t2.large"]
}
