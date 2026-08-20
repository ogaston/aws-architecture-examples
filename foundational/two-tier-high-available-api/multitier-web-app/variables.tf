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


variable "instance_type" {
  description = "The type of instance to launch"
  default     = "t2.micro"
}

variable "ssh_user" {
  description = "The SSH user for the instance"
  default     = "ubuntu"
}
