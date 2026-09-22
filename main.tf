data "aws_availability_zones" "available" {
  state = "available"
}


resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.project_name}-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-subnet-1"
  }

}

resource "aws_subnet" "public_subnet_2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.project_name}-public-subnet-2"
  }

}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone_1b
  tags = {
    Name = "${var.project_name}-private-subnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "${var.project_name}-public-rt"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public.id
}



