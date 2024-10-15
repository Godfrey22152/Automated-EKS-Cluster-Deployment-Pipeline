# modules/eks/outputs.tf
output "cluster_id" {
  value = aws_eks_cluster.odo.id
}

output "node_group_id" {
  value = aws_eks_node_group.odo.id
}

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.odo.name 
}

output "eks_node_group_name" {
  description = "Name of the EKS node group"
  value       = aws_eks_node_group.odo.node_group_name
}

output "eks_cluster_endpoint" {
  description = "Endpoint of the EKS cluster"
  value       = aws_eks_cluster.odo.endpoint
}

output "eks_cluster_certificate_authority_data" {
  description = "EKS cluster's certificate authority data"
  value       = aws_eks_cluster.odo.certificate_authority[0].data
}

output "eks_cluster_arn" {
  value = aws_eks_cluster.odo.arn
}

output "eks_cluster_version" {
  description = "EKS Cluster version"
  value = aws_eks_cluster.odo.version
}

output "node_group_name" {
  value = aws_eks_node_group.odo.node_group_name
}

output "node_group_role_arn" {
  value = aws_iam_role.odo_node_group_role.arn
}

output "eks_cluster_role_arn" {
  value = aws_iam_role.odo_cluster_role.arn
}
