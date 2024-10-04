terraform {
  required_version = "~> 1.9.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
  backend "s3" {
    bucket         = "daws76ss-state-dev"
    region         = "us-east-1"
    key            = "vpc/terraform.tfstate"
    dynamodb_table = "daws76s-locking-dev"
    encrypt        = true
  }
}

provider "aws" {
  # Configuration options
  region = var.region
}