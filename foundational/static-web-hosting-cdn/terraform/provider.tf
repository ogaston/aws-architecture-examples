terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region

  default_tags {
    tags = local.common_tags
  }
}


# Dedicated provider for ACM
provider "aws" {
  alias      = "acm_provider"
  region     = "us-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key

  default_tags {
    tags = local.common_tags
  }
}
