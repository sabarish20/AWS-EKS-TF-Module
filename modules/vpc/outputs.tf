output "vpc_id" {
    value = aws_vpc.eksvpc.id
}

output "pub_subnet_id" {
    value = [for pubsub in aws_subnet.pub_sub : pubsub.id]
}

output "pvt_subnet_id" {
    value = [for pvtsub in aws_subnet.pvt_sub : pvtsub.id]
}

