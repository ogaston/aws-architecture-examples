terraform {
  backend "s3" {
    bucket = "terraform-example-ogaston"
    key    = "terraform.tfstate"
    region = var.aws_region
  }
}
