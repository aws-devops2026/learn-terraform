variable "components" {
    default = ["frontend", "catalogue", "shipping", "user", "cart", "payment"]
}

variable "ami_id" {
  default = "ami-0fcc78c828f981df2"
}

variable "instance_type" {
    default = "t3.micro"
  
}
