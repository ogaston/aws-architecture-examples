variable "aws_access_key" {
  description = "AWS Access Key"
  validation {
    condition     = length(var.aws_access_key) > 0
    error_message = "AWS Access Key cannot be empty"
  }
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  validation {
    condition     = length(var.aws_secret_key) > 0
    error_message = "AWS Secret Key cannot be empty"
  }
}

variable "aws_region" {
  description = "The AWS region to deploy to"
  default     = "us-east-1"
}

variable "domain_name" {
  description = "The root domain name (e.g., ogaston-aws.shop)"
  type        = string

  validation {
    condition     = length(var.domain_name) > 0
    error_message = "domain_name cannot be empty"
  }
}

variable "bucket_name" {
  description = "Unique name for the private S3 bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9.-]{1,61}[a-z0-9]$", var.bucket_name))
    error_message = "bucket_name must be 3-63 characters, lowercase letters, numbers, dots, and hyphens only, and must start/end with a letter or number."
  }
}

variable "subdomain" {
  description = "FQDN for this app, e.g. spa.ogaston-aws.shop"
  type        = string

  validation {
    condition     = length(var.subdomain) > 0
    error_message = "subdomain cannot be empty"
  }
}

variable "project_name" {
  description = "Name of the project, used for the ProjectName tag. Defaults to bucket_name if not set."
  type        = string
  default     = ""
}

variable "owner" {
  description = "Owner of the resources, used for the Owner tag."
  type        = string
  default     = "unknown"
}

variable "tags" {
  description = "Additional freeform tags to merge into every resource's default tags."
  type        = map(string)
  default     = {}
}

variable "index_document_path" {
  description = "Local path to the index.html file to upload as the site's default root object."
  type        = string
  default     = "../index.html"
}

variable "manage_dns_record" {
  description = "Whether to create a Route53 alias record for the subdomain pointing at CloudFront. Set to false if domain_name's DNS is not hosted in Route53 or you manage records elsewhere."
  type        = bool
  default     = true
}
