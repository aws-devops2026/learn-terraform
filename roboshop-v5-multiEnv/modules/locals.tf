locals {
  get_instance_ip = var.internal ? aws_instance.main.private_ip : aws_instance.main.public_ip
}
