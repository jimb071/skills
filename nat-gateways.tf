# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway

resource "aws_nat_gateway" "gw1" {
  # Allocation ID of EIP address from EIP
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "gw NAT"
  }
}