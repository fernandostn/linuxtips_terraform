data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  owners = ["099720109477"] #canonical/ubuntu
}


resource "aws_instance" "web-east" {
  #count = var.servers
  #ami = "ami-0885b1f6bd170450c"
  #ami = data.aws_ami.ubuntu.id
  #count = var.env == "production" ? 2 + var.plus : 1
  #count = var.production ? 2 : 1
  ami           = var.image_id #estou pegando a ami através de variável somente para us-east-1
  instance_type = "t2.micro"
  #instance_type = count.index < 1 ? "t2.micro" : "t3.medium" # a primeira instância será t2.micro, as demais serão t3.medium

  tags = {
    Name = "HelloWorld"
    Env  = var.env
  }
}

/*

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.web-east.id
  # instance = aws_instance.web-east.id
}


data "aws_ami" "ubuntu-west2" {
    #provider = aws.west-2
    most_recent = true

    filter {
      name = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
    }
    owners = ["099720109477"] #canonical/ubuntu
}


resource "aws_instance" "web2" {
  #provider = aws.west-2  
  #ami           = "ami-0885b1f6bd170450c"
  ami = data.aws_ami.ubuntu-west2.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
  depends_on = [ aws_instance.web-east ]

}

*/