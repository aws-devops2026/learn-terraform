variable "cityName" {
    type        = string
    description = "The name of the city"
    default     = "Bangalore"
}

output "cityName" {
    value = var.cityName
}

# Example of list variable 
variable "fruits" {
    type        = list(string)
    description = "List of fruits"
    default     = [
        "Apple", 
        "Banana", 
        "Cherry"
    ]
}