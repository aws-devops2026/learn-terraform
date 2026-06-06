resource "aws_instance" "main" {
    count = length(var.components)
  ami           = var.ami_id
  instance_type = "var.instance_type"

  tags = {
    Name = var.components[count.index]
  }
}

#resource "aws_instance" "main" {
  #count        = length(var.components)
 # ami           = var.ami_id
  #instance_type = var.instance_type

 # tags = {
   # Name = var.components[count.index]
 # }
#}



