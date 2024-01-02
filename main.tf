terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIATLFTJKFYNT4TVKHL"
  secret_key = "53fU/2Gx4Q8A3HWKl0+mC2VN3f2EA1U59ZTQpRtU"
}
resource "aws_instance" "example" {
  ami           = "ami-02a2af70a66af6dfb"
  instance_type = "t2.xlarge"
  key_name      = "bbs"
  # Add other configuration details based on your existing instance
tags = {
    Name        = "Dev/test"
    # Add any other tags you need
  }
}
