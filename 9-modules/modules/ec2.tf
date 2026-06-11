resource "aws_instance" "main" {

  ami           = data.aws_ami.latest.id
  instance_type = var.instance_type

  # Exception Handling : If instance_type is not mentioned for any component, then it will take t3.micro as default value.

  tags = {
    Name = var.instance_name
  }
}
