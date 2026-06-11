module "ec2" {
    source   = "./modules"
    env_name = var.env_name
  
}