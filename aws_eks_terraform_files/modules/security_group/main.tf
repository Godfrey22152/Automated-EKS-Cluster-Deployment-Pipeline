# modules/security_groups/main.tf
resource "aws_security_group" "odo_cluster_sg" { 
  name        = var.cluster_sg_name 
  description = "EKS cluster security group"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.cluster_sg_name_tag
  }
}

resource "aws_security_group" "odo_node_sg" { 
  name        = var.node_sg_name 
  description = "EKS node group security group"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.node_sg_name_tag
  }
}
