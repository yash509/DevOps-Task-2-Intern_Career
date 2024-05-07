
provider "aws"{
  region ="${var.region}"
  profile="default"
}

resource "aws_vpc""myvpc"{
  cidr_block=var.vpc_cidr
  tags={
    Name=var.vpc_name
   }
}

resource "aws_subnet""subnetA"{
  vpc_id=aws_vpc.myvpc.id
  cidr_block=var.subnetA_cidr
  tags={
    Name=var.subnetA_name
  }
}

resource "aws_subnet""subnetB"{
  vpc_id=aws_vpc.myvpc.id
  cidr_block=var.subnetB_cidr
  tags={
    Name=var.subnetB_name
  }
}

resource "aws_security_group""mysg"{
  vpc_id=aws_vpc.myvpc.id
  tags={
    Name="Terra-SG"
  }
  ingress{
    protocol="tcp"
    from_port=22
    to_port=22
    cidr_blocks=["0.0.0.0/0"]
  }
  egress{
    protocol="tcp"
    cidr_blocks=["0.0.0.0/0"]
    from_port=0
    to_port=0
  }
}

resource "aws_instance""myec2"{
  ami="ami-013e83f579886baeb"
  instance_type="t2.micro"
  subnet_id=aws_subnet.subnetA.id
  tags={
    Name="Terra-Ec2"
  }
  security_groups=[aws_security_group.mysg.id]
  key_name="K8"
}
