resource "aws_route_table" "pvt_rt" {
    vpc_id = aws_vpc.eksvpc.id
    tags = {
      Name = "Pvt-RouteTable"
    }
}

resource "aws_route" "pvt_route" {
    route_table_id = aws_route_table.pvt_rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw.id
}

resource "aws_route_table_association" "pvt_rta" {
    for_each = aws_subnet.pvt_sub
    subnet_id = each.value.id
    route_table_id = aws_route_table.pvt_rt.id
}