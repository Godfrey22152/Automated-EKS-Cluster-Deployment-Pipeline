resource "aws_vpc" "odo_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "odo_subnet" {
  count                   = var.subnet_count
  vpc_id                  = aws_vpc.odo_vpc.id
  cidr_block              = cidrsubnet(aws_vpc.odo_vpc.cidr_block, 8, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.subnet_name}-${count.index}"
  }
}

resource "aws_internet_gateway" "odo_igw" {
  vpc_id = aws_vpc.odo_vpc.id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route_table" "odo_route_table" {
  vpc_id = aws_vpc.odo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.odo_igw.id
  }

  tags = {
    Name = var.route_table_name
  }
}

resource "aws_route_table_association" "odo_route_table_association" {
  count          = var.subnet_count
  subnet_id      = aws_subnet.odo_subnet[count.index].id
  route_table_id = aws_route_table.odo_route_table.id
}
