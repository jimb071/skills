resource "aws_subnet" "public" {
  # mandatory value / taken from vpc file
  vpc_id = aws_vpc.main.id

  cidr_block = "192.168.200.0/26"

  availability_zone = "us-east-2a"

  # required for EKS
  map_public_ip_on_launch = true

  tags = {
    Name = "public-us-east-2a"

  }
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id

    cidr_block = "192.168.200.128/26"

    availability_zone = "us-east-2a"

    tags = {
    Name = "private-us-east-2a"
    }
}