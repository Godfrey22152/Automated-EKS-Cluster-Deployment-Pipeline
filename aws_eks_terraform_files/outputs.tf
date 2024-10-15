# 1. EKS Cluster Name
output "eks_cluster_name" {
  description = "The name of the EKS cluster"
  value       = module.eks.cluster_name 
}

# 2. EKS Cluster Endpoint
output "eks_cluster_endpoint" {
  description = "The endpoint of the EKS cluster"
  value       = module.eks.eks_cluster_endpoint
}

# 3. EKS Cluster ARN
output "eks_cluster_arn" {
  description = "The ARN of the EKS cluster"
  value       = module.eks.eks_cluster_arn
}

# 4. EKS Cluster Certificate Authority Data
output "eks_cluster_certificate_authority_data" {
  description = "The certificate authority data for the EKS cluster"
  value       = module.eks.eks_cluster_certificate_authority_data
}

# 5. EKS Cluster IAM Role ARN
output "eks_cluster_role_arn" {
  description = "The IAM role ARN for the EKS cluster"
  value       = module.eks.eks_cluster_role_arn
}

# 6. EKS Cluster Security Group ID
output "eks_cluster_security_group_id" {
  description = "The security group ID used by the EKS cluster"
  value       = module.security_group.cluster_security_group_id
}

# 7. EKS Node Group Name
output "eks_node_group_name" {
  description = "The name of the EKS node group"
  value       = module.eks.node_group_name
}

# 8. EKS Node IAM Role ARN
output "eks_node_group_role_arn" {
  description = "The IAM role ARN for the EKS node group"
  value       = module.eks.node_group_role_arn
}

# 9. EKS Node Security Group ID
output "eks_node_security_group_id" {
  description = "The security group ID used by the EKS nodes"
  value       = module.security_group.node_security_group_id
}

# 10. EKS Cluster Version
output "eks_cluster_version" {
  description = "The Kubernetes version of the EKS cluster"
  value       = module.eks.eks_cluster_version
}

# 11. EKS Cluster VPC ID
output "eks_vpc_id" {
  description = "The VPC ID of the EKS cluster"
  value       = module.vpc.vpc_id
}

# 12. EKS Cluster Subnet IDs
output "eks_subnet_ids" {
  description = "The subnet IDs used by the EKS cluster"
  value       = module.vpc.subnet_ids
}


