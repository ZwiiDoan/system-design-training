resource "aws_vpc_peering_connection" "vpc_a_to_vpc_b" {
  vpc_id      = aws_vpc.vpc_a.id
  peer_vpc_id = aws_vpc.vpc_b.id
  auto_accept = true
  tags = {
    Name = "vpc-a-to-vpc-b"
  }
}

# Route from VPC A to VPC B
resource "aws_route" "vpc_a_to_vpc_b" {
  route_table_id            = aws_route_table.vpc_a_private.id
  destination_cidr_block    = aws_vpc.vpc_b.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_a_to_vpc_b.id
}

# Route from VPC B to VPC A
resource "aws_route" "vpc_b_to_vpc_a" {
  route_table_id            = aws_route_table.vpc_b_private.id
  destination_cidr_block    = aws_vpc.vpc_a.cidr_block
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_a_to_vpc_b.id
}
