variable "vpc_id" {}
variable "dev_project_sg_name" {}
variable "Name_tag" {}


output "dev_project_sg_id" {
  value = aws_security_group.dev_project_sg.id  
}

output "security_group_name" {
  value = aws_security_group.dev_project_sg.name
}


# Create Security Group
resource "aws_security_group" "dev_project_sg" {
  name   = var.dev_project_sg_name
  vpc_id = var.vpc_id
  description = "Basic Ports needed to be open for the project"

  tags = {
    Name = var.Name_tag   
  }
}

# Inbound Rules using separate aws_vpc_security_group_ingress_rule resources
# HTTPS (Port 443) IPV4
resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.dev_project_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
  description       = "HTTPS (Port 443)"
}


# HTTP (Port 80) IPV4
resource "aws_vpc_security_group_ingress_rule" "http_rule_ipv4" {
  security_group_id = aws_security_group.dev_project_sg.id
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "HTTP (Port 80)"
}

# Jenkins Port
resource "aws_vpc_security_group_ingress_rule" "app_services_rule" {
  security_group_id = aws_security_group.dev_project_sg.id
  from_port         = 8080
  to_port           = 8080
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Jenkins port"
}

# SSH (Port 22)
resource "aws_vpc_security_group_ingress_rule" "ssh_rule" {
  security_group_id = aws_security_group.dev_project_sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "SSH (Port 22)"
}

# Kubernetes API server (Port 6443)
resource "aws_vpc_security_group_ingress_rule" "k8s_api_rule" {
  security_group_id = aws_security_group.dev_project_sg.id
  from_port         = 6443
  to_port           = 6443
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Kubernetes API server (Port 6443)"
}

# NodePort range for Kubernetes services (Ports 30000-32767)
resource "aws_vpc_security_group_ingress_rule" "k8s_nodeport_rule" {
  security_group_id = aws_security_group.dev_project_sg.id
  from_port         = 30000
  to_port           = 32767
  ip_protocol       = "tcp"
  cidr_ipv4         = "0.0.0.0/0"
  description       = "Kubernetes NodePort range (Ports 30000-32767)"
}

# Outbound Rule using separate aws_vpc_security_group_egress_rule resource
resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.dev_project_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
