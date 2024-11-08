# Terraform Settings Block
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      #version = ">= 4.65"
      version = ">= 5.31"
    }
  }
  # Adding Backend as S3 for Remote State Storage
  backend "s3" {
    # bucket = "terraform-on-aws-eks"
    bucket = "b1dev-terraform-state-eks"
    key    = "dev/eks-cluster/43-terraform.tfstate"
    region = "us-east-1"

    # For State Locking
    dynamodb_table = "dev-ekscluster"
  }
}

# Terraform Provider Block
provider "aws" {
  region = var.aws_region
}