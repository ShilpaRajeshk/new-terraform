resource "aws_eip" "nat-eip" {
    count = length(var.cidr_private_subnet)
    #vpc = true   
  
}

resource "aws_nat_gateway" "nat_gateway" {
    count = length(var.cidr_private_subnet)
    depends_on = [ aws_eip.nat-eip ]
    allocation_id = aws_eip.nat-eip[count.index].id
    subnet_id = aws_subnet.Private-subnet[count.index].id
    tags = {
      Name = "Private NAT GW"
    }
}
