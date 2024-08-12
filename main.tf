provider "aws" {
    region = "ap-south-1"
  
}

resource "aws_instance" "ssg" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.aws_instance_type
  
}