resource "aws_vpc" "compliance-test" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "compliance vpc"
  }
}
