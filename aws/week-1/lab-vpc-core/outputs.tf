# VPC Outputs
output "vpc_a_id" {
  value       = aws_vpc.vpc_a.id
  description = "The ID of VPC A."
}
output "vpc_b_id" {
  value       = aws_vpc.vpc_b.id
  description = "The ID of VPC B."
}

# Subnet Outputs
output "vpc_a_public_subnet_id" {
  value       = aws_subnet.vpc_a_public.id
  description = "The ID of VPC A's first public subnet."
}
output "vpc_a_public_2_subnet_id" {
  value       = aws_subnet.vpc_a_public_2.id
  description = "The ID of VPC A's second public subnet."
}
output "vpc_a_private_subnet_id" {
  value       = aws_subnet.vpc_a_private.id
  description = "The ID of VPC A's first private subnet."
}
output "vpc_a_private_2_subnet_id" {
  value       = aws_subnet.vpc_a_private_2.id
  description = "The ID of VPC A's second private subnet."
}
output "vpc_b_public_subnet_id" {
  value       = aws_subnet.vpc_b_public.id
  description = "The ID of VPC B's first public subnet."
}
output "vpc_b_public_2_subnet_id" {
  value       = aws_subnet.vpc_b_public_2.id
  description = "The ID of VPC B's second public subnet."
}
output "vpc_b_private_subnet_id" {
  value       = aws_subnet.vpc_b_private.id
  description = "The ID of VPC B's first private subnet."
}
output "vpc_b_private_2_subnet_id" {
  value       = aws_subnet.vpc_b_private_2.id
  description = "The ID of VPC B's second private subnet."
}

# Route Table Outputs
output "vpc_a_private_route_table_id" {
  value = aws_route_table.vpc_a_private.id
}
output "vpc_b_private_route_table_id" {
  value = aws_route_table.vpc_b_private.id
}
