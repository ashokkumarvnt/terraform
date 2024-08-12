output "aws_instance" {
  value = aws_instance.ssg.public_ip
}

output "ami" {
    value = aws_instance.ssg.ami
  
}