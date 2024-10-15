# modules/eks/main.tf
resource "aws_eks_cluster" "odo" { 
  name     = var.cluster_name
  role_arn = aws_iam_role.odo_cluster_role.arn

  vpc_config {
    subnet_ids         = var.subnet_ids
    security_group_ids = var.cluster_security_group_ids
  }
}

resource "aws_eks_node_group" "odo" {
  cluster_name    = aws_eks_cluster.odo.name
  node_group_name = var.node_group_name
  node_role_arn   = aws_iam_role.odo_node_group_role.arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types

  remote_access {
    ec2_ssh_key = var.ssh_key_name
    source_security_group_ids = var.node_security_group_ids
  }
}

# IAM Role for EKS Cluster
resource "aws_iam_role" "odo_cluster_role" {
  name = var.cluster_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Policy attachment for EKS Cluster role
resource "aws_iam_role_policy_attachment" "odo_cluster_role_policy" {
  role       = aws_iam_role.odo_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

# IAM Role for EKS Node Group
resource "aws_iam_role" "odo_node_group_role" {
  name = var.node_group_role_name

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Policy attachment for EKS Node Group role
resource "aws_iam_role_policy_attachment" "odo_node_group_role_policy" {
  role       = aws_iam_role.odo_node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

# Policy for EKS CNI
resource "aws_iam_role_policy_attachment" "odo_node_group_cni_policy" {
  role       = aws_iam_role.odo_node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

# Policy for EKS node group access to container registry
resource "aws_iam_role_policy_attachment" "odo_node_group_registry_policy" {
  role       = aws_iam_role.odo_node_group_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

