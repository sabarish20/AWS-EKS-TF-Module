locals {
  az_map = {
    for idx, az in var.az : az => idx 
  }
}

resource "aws_subnet" "pub_sub" {
    vpc_id = aws_vpc.eksvpc.id
    for_each = local.az_map
    availability_zone = each.key
    cidr_block = cidrsubnet(aws_vpc.eksvpc.cidr_block, 8, each.value)
    map_public_ip_on_launch = var.map_public_ip_on_launch

    tags = {
      Name = "PubSub-${each.key}"
      "kubernetes.io/role/elb" = "1"
    }
}

resource "aws_subnet" "pvt_sub" {
    vpc_id = aws_vpc.eksvpc.id
    for_each = local.az_map
    availability_zone = each.key
    cidr_block = cidrsubnet(aws_vpc.eksvpc.cidr_block, 8, each.value + length(var.az))

    tags = {
      Name = "PvtSub-${each.key}"
      "kubernetes.io/role/internal-elb" = "1"
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
}