resource "aws_instance" "this" {
  ami           = "ami-0fcc78c828f981df2"
  instance_type = "t3.micro"

  tags = {
    Name = "B60-Demo-Ec3"
  }
}