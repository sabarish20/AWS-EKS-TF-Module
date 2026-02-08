resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.eksvpc.id
    tags = {
      Name = "EKS-IGW"
    }
}