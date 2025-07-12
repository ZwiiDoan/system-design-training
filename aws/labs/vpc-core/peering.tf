resource "aws_vpc_peering_connection" "vpc_a_to_vpc_b" {
  vpc_id        = aws_vpc.vpc_a.id
  peer_vpc_id   = aws_vpc.vpc_b.id
  auto_accept   = true
  tags = {
    Name = "vpc-a-to-vpc-b"
  }
}

# Add peering routes for each private subnet CIDR
resource "aws_route" "vpc_a_private_to_vpc_b_private_1" {
  route_table_id            = aws_route_table.vpc_a_private.id
  destination_cidr_block    = aws_subnet.vpc_b_private.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_a_to_vpc_b.id
}

resource "aws_route" "vpc_a_private_to_vpc_b_private_2" {
  route_table_id            = aws_route_table.vpc_a_private.id
  destination_cidr_block    = aws_subnet.vpc_b_private_2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_a_to_vpc_b.id
}

resource "aws_route" "vpc_b_private_to_vpc_a_private_1" {
  route_table_id            = aws_route_table.vpc_b_private.id
  destination_cidr_block    = aws_subnet.vpc_a_private.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_a_to_vpc_b.id
}

resource "aws_route" "vpc_b_private_to_vpc_a_private_2" {
  route_table_id            = aws_route_table.vpc_b_private.id
  destination_cidr_block    = aws_subnet.vpc_a_private_2.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_a_to_vpc_b.id
}
