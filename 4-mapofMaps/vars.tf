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

