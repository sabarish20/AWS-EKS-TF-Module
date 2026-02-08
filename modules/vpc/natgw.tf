resource "aws_eip" "nat_ip" {
    domain = "vpc"
}

resource "aws_nat_gateway" "natgw" {
    subnet_id = aws_subnet.pub_sub[var.az[0]].id
    allocation_id = aws_eip.nat_ip.id

    tags = {
      Name = "EKS-NatGW"
    }

    depends_on = [ 
        aws_internet_gateway.igw
     ]
}