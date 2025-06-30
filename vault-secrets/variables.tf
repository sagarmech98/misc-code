variable "token" {}

variable "secrets" {
  default = {
    roboshop-dev = {
      description = "RoboShop App Component All secrets"
    }
    roboshop-infra = {
      description = "Roboshop Infra related secrets"
    }
  }
}

variable "values" {
  default = {
    cart = {
      secret = "roboshop-dev"
      value = {
        zip = "zap",
        foo = "bar"
      }
    }
    frontend = {
      secret = "roboshop-dev"
      value = {
        catalogue_url = "http://catalogue-dev.vidyapractice.shop:8080/"
        user_url      = "http://user-dev.vidyapractice.shop:8080/"
        cart_url      = "http://cart-dev.vidyapractice.shop:8080/"
        payment_url   = "http://payment-dev.vidyapractice.shop:8080/"
        shipping_url  = "http://shipping-dev.vidyapractice.shop:8080/"
      }
    }
    ssh = {
      secret = "roboshop-infra"
      value = {
        username = "testing"
        password = "Password@1234"
      }
    }
  }
}