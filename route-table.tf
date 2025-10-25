resource "aws_route_table" "route-public-subnet" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = {
    Name = "Route Table"
  }
}

resource "aws_route_table" "route-private-subnet" {
    count = length(var.cidr_private_subnet)
    vpc_id = aws_vpc.main.id
    depends_on = [ aws_nat_gateway.nat_gateway ]

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway[count.index].id
    }
    tags = {
        Name = "Route Table"
    }
}
