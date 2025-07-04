# Custom route tables and associations for private subnets
resource "aws_route_table" "vpc_a_private" {
  vpc_id = aws_vpc.vpc_a.id
  tags = {
    Name = "vpc-a-private-rt"
  }
}

resource "aws_route_table_association" "vpc_a_private_1" {
  subnet_id      = aws_subnet.vpc_a_private.id
  route_table_id = aws_route_table.vpc_a_private.id
}

resource "aws_route_table_association" "vpc_a_private_2" {
  subnet_id      = aws_subnet.vpc_a_private_2.id
  route_table_id = aws_route_table.vpc_a_private.id
}

resource "aws_route_table" "vpc_b_private" {
  vpc_id = aws_vpc.vpc_b.id
  tags = {
    Name = "vpc-b-private-rt"
  }
}

resource "aws_route_table_association" "vpc_b_private_1" {
  subnet_id      = aws_subnet.vpc_b_private.id
  route_table_id = aws_route_table.vpc_b_private.id
}

resource "aws_route_table_association" "vpc_b_private_2" {
  subnet_id      = aws_subnet.vpc_b_private_2.id
  route_table_id = aws_route_table.vpc_b_private.id
}

resource "aws_route_table" "vpc_a_public" {
  vpc_id = aws_vpc.vpc_a.id
  tags = {
    Name = "vpc-a-public-rt"
  }
}

resource "aws_route_table_association" "vpc_a_public_1" {
  subnet_id      = aws_subnet.vpc_a_public.id
  route_table_id = aws_route_table.vpc_a_public.id
}

resource "aws_route_table_association" "vpc_a_public_2" {
  subnet_id      = aws_subnet.vpc_a_public_2.id
  route_table_id = aws_route_table.vpc_a_public.id
}

resource "aws_route_table" "vpc_b_public" {
  vpc_id = aws_vpc.vpc_b.id
  tags = {
    Name = "vpc-b-public-rt"
  }
}

resource "aws_route_table_association" "vpc_b_public_1" {
  subnet_id      = aws_subnet.vpc_b_public.id
  route_table_id = aws_route_table.vpc_b_public.id
}

resource "aws_route_table_association" "vpc_b_public_2" {
  subnet_id      = aws_subnet.vpc_b_public_2.id
  route_table_id = aws_route_table.vpc_b_public.id
}

# Default routes for public subnets
resource "aws_route" "vpc_a_public_igw" {
  route_table_id         = aws_route_table.vpc_a_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_a_igw.id
}

resource "aws_route" "vpc_b_public_igw" {
  route_table_id         = aws_route_table.vpc_b_public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.vpc_b_igw.id
}

# Default routes for private subnets
resource "aws_route" "vpc_a_private_nat" {
  route_table_id         = aws_route_table.vpc_a_private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.vpc_a_nat.id
}

resource "aws_route" "vpc_b_private_nat" {
  route_table_id         = aws_route_table.vpc_b_private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.vpc_b_nat.id
}
