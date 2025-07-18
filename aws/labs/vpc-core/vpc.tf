resource "aws_vpc" "vpc_a" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "vpc-a"
  }
}

resource "aws_vpc" "vpc_b" {
  cidr_block = "10.1.0.0/16"
  tags = {
    Name = "vpc-b"
  }
}

resource "aws_subnet" "vpc_a_public" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "vpc-a-public-${data.aws_availability_zones.available.names[0]}"
  }
}

resource "aws_subnet" "vpc_a_private" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.0.4.0/22"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "vpc-a-private-${data.aws_availability_zones.available.names[1]}"
  }
}

resource "aws_subnet" "vpc_a_public_2" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "vpc-a-public-${data.aws_availability_zones.available.names[1]}"
  }
}

resource "aws_subnet" "vpc_a_private_2" {
  vpc_id            = aws_vpc.vpc_a.id
  cidr_block        = "10.0.8.0/22"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "vpc-a-private-${data.aws_availability_zones.available.names[0]}"
  }
}

resource "aws_subnet" "vpc_b_public" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "vpc-b-public-${data.aws_availability_zones.available.names[0]}"
  }
}

resource "aws_subnet" "vpc_b_private" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.4.0/22"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "vpc-b-private-${data.aws_availability_zones.available.names[1]}"
  }
}

resource "aws_subnet" "vpc_b_public_2" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]
  tags = {
    Name = "vpc-b-public-${data.aws_availability_zones.available.names[1]}"
  }
}

resource "aws_subnet" "vpc_b_private_2" {
  vpc_id            = aws_vpc.vpc_b.id
  cidr_block        = "10.1.8.0/22"
  availability_zone = data.aws_availability_zones.available.names[0]
  tags = {
    Name = "vpc-b-private-${data.aws_availability_zones.available.names[0]}"
  }
}

resource "aws_internet_gateway" "vpc_a_igw" {
  vpc_id = aws_vpc.vpc_a.id
  tags = {
    Name = "vpc-a-igw"
  }
}

resource "aws_internet_gateway" "vpc_b_igw" {
  vpc_id = aws_vpc.vpc_b.id
  tags = {
    Name = "vpc-b-igw"
  }
}

resource "aws_eip" "vpc_a_nat_eip" {
  domain = "vpc"
}

resource "aws_eip" "vpc_b_nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "vpc_a_nat" {
  allocation_id = aws_eip.vpc_a_nat_eip.id
  subnet_id     = aws_subnet.vpc_a_public.id
  tags = {
    Name = "vpc-a-nat"
  }
  depends_on = [aws_internet_gateway.vpc_a_igw]
}

resource "aws_nat_gateway" "vpc_b_nat" {
  allocation_id = aws_eip.vpc_b_nat_eip.id
  subnet_id     = aws_subnet.vpc_b_public.id
  tags = {
    Name = "vpc-b-nat"
  }
  depends_on = [aws_internet_gateway.vpc_b_igw]
}
