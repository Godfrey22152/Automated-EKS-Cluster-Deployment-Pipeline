output "cluster_security_group_id" {
  description = "The ID of the cluster security group"
  value       = aws_security_group.odo_cluster_sg.id
}

output "node_security_group_id" {
  description = "The ID of the node security group"
  value       = aws_security_group.odo_node_sg.id
}
