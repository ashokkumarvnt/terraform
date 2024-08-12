resource "aws_vpc" "eks" {
    cidr_block = "10.0.0.0/24"
  tags = {
    name = "eks"
  }
}

resource "aws_subnet" "subnet_public" {
    vpc_id = aws_vpc.eks.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
}

resource "aws_subnet" "subnet_private" {
    vpc_id = aws_vpc.eks.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "ap-south-1b"

  
}

resource "aws_internet_gateway" "all" {
    vpc_id = aws_vpc.eks.id
}

resource "aws_route_table" "all" {
     vpc_id = aws_vpc.eks.id
     route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.all.id
     }    
  
}

resource "aws_route_table_association" "rta" {
    subnet_id = aws_subnet.subnet_public.id
    route_table_id = aws_route_table.all.id

  
}