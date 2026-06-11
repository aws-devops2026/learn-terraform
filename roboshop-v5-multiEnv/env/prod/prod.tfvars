# Value of the map of maps for components variable, we can use this in any environment and change the instance type as per the requirement of the environment. This is how we can achieve the DRY code in terraform.
components = {
    mongodb = {
        instance_type = "t3.medium"
        internal = true
    }
    catalogue = {
        instance_type = "t3.micro"
        internal = true
    }
    redis = {
        instance_type = "t3.micro"
        internal = true
    }
    user = {
        instance_type = "t3.micro"
        internal = true
    }
    cart = {
        instance_type = "t3.micro"
        internal = true
    }
    mysql = {
        instance_type = "t3.medium"
        internal = true
    }
    shipping = {
        instance_type = "t3.medium"
        internal = true
    }
    rabbitmq = {
        instance_type = "t3.micro"
        internal = true
    }
    payment = {
        instance_type = "t3.micro"
        internal = true
    }
    frontend = {
        instance_type = "t3.micro"
        internal = false
    }
}

env_name = "prod"
ami_name = "DevOps-LabImage-RHEL9"
sg_name = "b60-sg"
domain_name = "robotshop.fun"