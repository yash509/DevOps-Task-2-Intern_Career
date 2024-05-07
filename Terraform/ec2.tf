provider "aws" {
  region     = "ap-south-1"
  profile    = "default"
}

resource "aws_instance" "myec2" {
  ami = "ami-026b57f3c383c2eec" 
  instance_type = "t2.micro"
  subnet_id = "subnet-0e91a1f7fc88ec32c"
  security_groups = ["sg-0b35d8431600bf13b"] 
  tags = {
      Name = "terraform"
  }
}
