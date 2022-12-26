terraform {
  backend "s3" {
    bucket = "binoyassignment-tf-state"
    key = "binoyassignment/tfstate.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}
