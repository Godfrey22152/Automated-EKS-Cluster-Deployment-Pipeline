# Setup VPC
resource "aws_vpc" "dev_project_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Setup public subnet
resource "aws_subnet" "dev_project_public_subnets" {
  count             = length(var.cidr_public_subnet)
  vpc_id            = aws_vpc.dev_project_vpc.id
  cidr_block        = element(var.cidr_public_subnet, count.index)
  availability_zone = element(var.eu_availability_zone, count.index)

  tags = {
    Name = "dev-project-public-subnet-${count.index + 1}"
  }
}

# Setup Internet Gateway
resource "aws_internet_gateway" "dev_project_public_internet_gateway" {
  vpc_id = aws_vpc.dev_project_vpc.id
  tags = {
    Name = "dev-project-igw"
  }
}

# Public Route Table
resource "aws_route_table" "dev_project_public_route_table" {
  vpc_id = aws_vpc.dev_project_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_project_public_internet_gateway.id
  }
  tags = {
    Name = "dev-project-public-rt"
  }
}

# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "dev_project_public_rt_subnet_association" {
  count          = length(aws_subnet.dev_project_public_subnets)
  subnet_id      = aws_subnet.dev_project_public_subnets[count.index].id
  route_table_id = aws_route_table.dev_project_public_route_table.id
}

