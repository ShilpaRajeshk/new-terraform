#Setup Public subnet

resource "aws_subnet" "public-subnet" {
    count = length(var.cidr_public_subnet)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.cidr_public_subnet,count.index)
    availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "Subnet -Public : public Subnet ${count.index + 1}"
  }
}

# Setup Private sunet

resource "aws_subnet" "Private-subnet" {
    count = length(var.cidr_private_subnet)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.cidr_private_subnet,count.index)
    availability_zone = element(var.availability_zone, count.index)

    tags = {
      Name = "Subnet - Private : Private subnet ${count.index + 1}"
    }
  
}
