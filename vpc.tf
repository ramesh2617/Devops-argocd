resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"  # Use the CIDR block of your existing VPC
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "bbs-vpc"
    # Add any other tags as needed
  }
}

