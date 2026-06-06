resource "aws_instance" "main" {
  for_each     = var.components

  ami           = each.value["ami_id"]
  instance_type = lookup(each.value, "instance_type", "t3.micro")
  # Exception Handling : If instance_type is not mentioned for any component, then it will take t3.micro as default value.

  tags = {
    Name = each.key
  }
}

# Lists are highly dependent on the order of the input, though they are same, 
#aslight change in the order will make them different. 
#So, we should be careful while using lists. In above code, we are creating 4 EC2 instances with names frontend, catalogue, shipping and payment. If we change the order of the list, 
#then the names of the EC2 instances will also change.