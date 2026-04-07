terraform {
  required_version = ">= 1.14.6"  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.39.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}