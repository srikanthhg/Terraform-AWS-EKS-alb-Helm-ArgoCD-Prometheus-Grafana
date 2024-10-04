data "tls_certificate" "eks-certificate" {
  url = aws_eks_cluster.eks[0].identity[0].oidc[0].issuer
}

data "aws_eks_cluster" "eks-cluster" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "eks-cluster-auth" {
  name = var.cluster_name
}