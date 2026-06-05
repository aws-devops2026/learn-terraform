# Demo On Map Of Maps
variable "fruitInfo" {
  type = map(map(string))
  default = {
    Apple = {
      color = "Red"
      taste = "Sweet"
      price = "100"
    }
    Banana = {
      color = "Yellow"
      taste = "Sweet"
      price = "80"
    }
    Lemon = {
      color = "Yellow"
      taste = "Sour"
      price = "50"
    }
  }
}


output "fruitInfo" {
  value = var.fruitInfo
}

output "appleInfo" {
  value = "Apple is ${var.fruitInfo["Apple"]["color"]} in color, tastes ${var.fruitInfo["Apple"]["taste"]} and costs ${var.fruitInfo["Apple"]["price"]}"
}

output "lemonInfo" {
  value = "Lemon is ${var.fruitInfo["Lemon"]["color"]} in color, testes ${var.fruitInfo["lemon"]["taste"]} and costs ${var.fruitInfo["Lemon"]["price"]}"
}

