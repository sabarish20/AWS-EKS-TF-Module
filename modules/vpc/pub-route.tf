resource "aws_route_table" "pub_rt" {
    vpc_id = aws_vpc.eksvpc.id
    tags = {
      Name = "Pub-RouteTable"
    }
}

resource "aws_route" "pub_route" {
    route_table_id = aws_route_table.pub_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "pub_rta" {
  for_each = aws_subnet.pub_sub
  subnet_id = each.value.id
  route_table_id = aws_route_table.pub_rt.id
}