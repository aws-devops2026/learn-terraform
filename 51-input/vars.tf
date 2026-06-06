variable "cityName" {
    type        = string
    description = "The name of the city"
    default     = "Bangalore"
}

output "cityName" {
  value = var.cityName
}


variable "environment" {
    type        = string
    description = "The environment for deployment"
}

output "environment" {
    value = var.environment
}
#vv
