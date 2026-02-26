terraform {
  backend "s3" {
    bucket         = "wakwetu-terraform-state-dan-alwende"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "wakwetu-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source          = "../../modules/vpc"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs             = ["us-east-1a", "us-east-1b"]
}

module "security" {
  source = "../../modules/security"
}

module "eks" {
  source             = "../../modules/eks"
  cluster_name       = "Wakwetu-IaC-Cluster"
  cluster_role_arn   = module.security.eks_cluster_role_arn
  node_role_arn      = module.security.eks_node_role_arn
  private_subnet_ids = module.vpc.private_subnet_ids
}
