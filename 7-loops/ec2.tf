resource "aws_instance" "main" {
  ami           = "ami-0fcc78c828f981df2"
  count = 3
  
  instance_type = "t3.medium"

  tags = {
    Name = "B60-Demo-Ec3"
  }
}