# Create a VPC
resource "aws_vpc" "lab_vpc" {
  cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone_1a

}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone_1b
}
