resource "aws_instance" "main" {
  for_each = var.components

  ami           = each.value["ami_id"]
  instance_type = lookup(each.value, "instance_type", "t3.small")

 # instance_type = lookup(each.value, "instance_type", "t3.micro")

# Exception Handling : If instance_type is not mentioned for any component, 
then it will take t3.micro as default value.

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



