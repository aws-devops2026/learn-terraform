module "ec2" {
    source   = "./modules"
    env_name = var.env_name
  
}

output "env_name" {
  value = module.ec2.env_name
}