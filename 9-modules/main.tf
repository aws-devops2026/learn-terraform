module "demo-ec2" {
    source        = "./modules"   # Path of the module, it can be local or remote (github, gitlab, bitbucket, terraform registry)
    instance_type = var.instance_type
    instance_name = var.instance_name
    ami_name      = var.ami_name
}
