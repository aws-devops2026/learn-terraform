resource "aws_instance" "main" {
  ami           = "ami-0fcc78c828f981df2"
  count = 3

  instance_type = "t3.micro"

  tags = {
    Name = "B60-Demo-Ec2-${count.index}"
  }
}

# Count s a loop, where each looped entity starts as 0, 1, 2 and so on. So, in above code, we are creating 3 EC2 instances with names B60-Demo-EC2-0, B60-Demo-EC2-1 and B60-Demo-EC2-2.
# How do we refer each instance created by the loop ?