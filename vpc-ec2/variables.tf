variable "vpc_cidr" {
  type = string
}

variable "public_subnets_cidr" {
  type = list(string)
}

variable "private_subnets_cidr" {
  type = list(string)
}

variable "region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "eks-cluster-sg" {
  type = string
}