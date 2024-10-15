/*terraform {
  backend "s3" {
    bucket         = "eks-cluster-remote-state-bucket-22152"
    #dynamodb_table = "state-lock"
    key            = "devops-eks-project/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
  }
}*/