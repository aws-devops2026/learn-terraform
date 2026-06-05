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

# Printing a list variable
output "fruits" {
    value = var.fruits
}

output "favFruit" {
    value = "Favourite fruit is ${var.fruits[1]}"
}


# Example of map variable
variable "person" {
    type = map(string)
    description = "Details of a person"
    default = {
        name = "Sai"
        city = "Thorrur-warangal"
        age  = "12"
    }
}