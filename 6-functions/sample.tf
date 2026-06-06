# Declaring an empty variable
variable "fruits" {}

output "fruits" {
  value = var.fruits

}


output "appleProperties" {
value = "Apple is ${var.fruits["apple"]["color"]} in color, tastes ${var.fruits["apple"]["taste"]}, costs ${var.fruits["apple"]["price"]} per ${var.fruits["apple"]["metrics"]} and is available in ${var.fruits["apple"]["state"]}"
}

  
# output "blueberryProperties" {
#     value = "Blueberries are ${var.fruits["blueberry"]["color"]} in color, taste ${var.fruits["blueberry"]["taste"]}, cost ${var.fruits["blueberry"]["price"]} per ${var.fruits["blueberry"]["metrics"]} and are available in ${var.fruits["blueberry"]["state"]}"
# }

output "blueberryProperties" {
    value = "Blueberries are ${lookup(var.fruits["blueberry"], "color", "unknown")} in color, taste ${lookup(var.fruits["blueberry"], "taste", "unknown")}, cost ${lookup(var.fruits["blueberry"], "price", "unknown")} per ${lookup(var.fruits["blueberry"], "metrics", "pound")} and are available in ${lookup(var.fruits["blueberry"], "state", "PUNJAB")}"
}