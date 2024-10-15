# modules/vpc/outputs.tf
output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.odo_vpc.id
}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = aws_subnet.odo_subnet[*].id
}

output "igw_id" {
  description = "The ID of the internet gateway"
  value       = aws_internet_gateway.odo_igw.id
}

output "route_table_id" {
  description = "The ID of the route table"
  value       = aws_route_table.odo_route_table.id
}
