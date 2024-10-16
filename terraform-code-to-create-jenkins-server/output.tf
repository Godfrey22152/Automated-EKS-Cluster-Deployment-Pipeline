output "jenkins_server_name" {
  description = "Jenkins Server Name"
  value       = module.jenkins_ec2_server.jenkins_server_name
}

output "jenkins_server_id" {
  description = "Server ID"
  value       = module.jenkins_ec2_server.jenkins_ec2_server
}

output "Jenkins_ec2_instance_public_ip" {
  description = "Server Public IP"
  value       = module.jenkins_ec2_server.Jenkins_ec2_instance_public_ip
}

output "security_group_id" {
  description = "Security Group ID"
  value       = module.security_group.dev_project_sg_id
}

output "server_public_subnets" {
  description = "Jenkins Server Public Subnets"
  value       = module.vpc.dev_project_public_subnets
}

output "security_group_name" {
  description = "Security Group Name"
  value       = module.security_group.security_group_name
}