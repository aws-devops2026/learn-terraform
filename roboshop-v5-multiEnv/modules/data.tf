# aws ami datasource
data "aws_ami" "latest" {
    most_recent = true
    
    owners = ["self"]

    filter {
        name   = "name"
        values = [var.ami_name] 
        
        # Name of the AMI, you can find it in the AWS console or by using AWS CLI
    }        

}

# Datasource for security group
data "aws_security_group" "selected" {
  name = var.sg_name
}

# Datasource for route53 zone, 
data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
}