variable "cityName" {
    type        = string
    description = "The name of the city"
    default     = "Bangalore"
}

output "cityName" {
    value = var.cityName
}
