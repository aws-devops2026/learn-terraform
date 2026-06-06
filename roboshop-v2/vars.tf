# Map Input : Map Of Maps 

variable "components" {
    default = {
        frontend = {
            instance_type = "t3.micro"
            ami_id = "ami-0fcc78c828f981df2"
        }
    
    catalogaue = {
    instance_type = "t3.micro"
            ami_id = "ami-0fcc78c828f981df2"
        }

    shipping = {
    instance_type = "t3.micro"
            ami_id = "ami-0fcc78c828f981df2"
        }

    payment = {
    instance_type = "t3.micro"
            ami_id = "ami-0fcc78c828f981df2"
        }
        }
}



#variable "ami_id" {
  #default = "ami-0fcc78c828f981df2"
#} 

