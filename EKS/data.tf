data "aws_vpc" "main_vpc" {
  filter{
    name   = "tag:Name"
    values = [ var.vpc_name ]  
  }
}

data "aws_subnet" "private_subnets" {
  filter{
    name = "vpc-id" # Filter by VPC ID
    values = [ data.aws_vpc.main_vpc.id ] # VPC ID from the data source
  }

  filter{
    name = "tag:kubernetes.io/role/internal-elb" # Filter by the specific tag
    values = [ "1" ] # Value to match
  }
}

data "aws_security_group" "eks-cluster-sg" {
  name = var.eks-cluster-sg
}

data "tls_certificate" "eks-certificate" {
  url = aws_eks_cluster.eks[0].identity[0].oidc[0].issuer
}

data "aws_eks_cluster" "eks-cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks-cluster-auth" {
  name = var.cluster_name
}