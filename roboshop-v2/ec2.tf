resource "aws_instance" "main" {
  for_each = var.components

  ami           = each.value["ami_id"]
  instance_type = each.value["instance_type"]

  tags = {
    Name = each.key
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



