provider "aws" {

 region = "us-east-2"
}
variable "image" {
  type = string
  default = "ami-0603cbe34fd08cb81"
}

variable "hw" {
  default = "t2.micro"
}

variable "name" {
  default = "ddp-vcs-tf"
}

variable "env" {
  default = "prod"
}

resource "aws_instance" "myawsserver" {
  ami = var.image
  instance_type = var.hw
  tags = {
    Name = lower (var.name)
    env = upper (var.env)
    owner = upper ("Dibya")
    dept = "eng"
    client = "jpmc"
  }
}

output "public-ip" {
  value = aws_instance.myawsserver.public_ip
}

output "private-ip" {
  value = aws_instance.myawsserver.private_ip
}
