terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.58"
    }
  }
}

module "elasticsearch" {
  source = "./providers"
  
}

resource "aws_instance" "skills_server" {
  ami           = "ami-00010259430e82229"
  instance_type = "t2.micro"

  tags = {
    Name = "skillsInstance"
  }
}