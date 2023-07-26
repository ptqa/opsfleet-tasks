provider "aws" {
  region = "us-west-2"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
}

terraform {
  required_version = ">= 1.5"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.22"
    }
  }
}

