resource "aws_route_table_association" "public-subnet-association" {
    count = length(var.cidr_public_subnet)
    depends_on = [ aws_subnet.public-subnet,aws_route_table.route-public-subnet ]
    subnet_id   = element(aws_subnet.public-subnet[*].id,count.index)
    route_table_id = aws_route_table.route-public-subnet.id
      
}

resource "aws_route_table_association" "private-subnet-association" {
    count = length(var.cidr_private_subnet)
    depends_on = [ aws_subnet.Private-subnet,aws_route_table.route-private-subnet ]
    subnet_id = element(aws_subnet.Private-subnet[*].id, count.index)
    route_table_id = aws_route_table.route-private-subnet[count.index].id
  
}
