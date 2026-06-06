# Declaring an empty variable
variable "fruits" {}

output "fruits" {
  value = var.fruits

}


output "appleProperties" {
value = "Apple is ${var.fruits["apple"]["color"]} in color, tastes ${var.fruits["apple"]["taste"]}, costs ${var.fruits["apple"]["price"]} per ${var.fruits["apple"]["metrics"]} and is available in ${var.fruits["apple"]["state"]}"
}

  
