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
        REDIS_HOST="redis-dev.vidyapractice.shop"
        CATALOGUE_HOST="catalogue-dev.vidyapractice.shop"
        CATALOGUE_PORT=8080
      }
    }
    catalogue = {
      secret = "roboshop-dev"
      value = {
        MONGO="redis-dev.vidyapractice.shop"
        MONGO_URL="catalogue-dev.vidyapractice.shop"
      }
    }
    user = {
      secret = "roboshop-dev"
      value = {
       REDIS_URL="redis://redis-dev.vidyapractice.shop:6379"
       MONGO_URL="mongodb://mongodb-dev.vidyapractice.shop:27017/users"
      }
    }
    shipping = {
      secret = "roboshop-dev"
      value = {
        CART_ENDPOINT="cart-dev.vidyapractice.shop:8080"
        DB_HOST="mysql-dev.vidyapractice.shop"
        username = "root"
        password = "RoboShop@1"
      }
    }
    payment = {
      secret = "roboshop-dev"
      value = {
        CART_HOST="cart-dev.vidyapractice.shop"
        CART_PORT="8080"
        USER_HOST="user-dev.vidyapractice.shop"
        USER_PORT="8080"
        AMQP_HOST="rabbitmq-dev.vidyapractice.shop"
        AMQP_USER="roboshop"
        AMQP_PASS="roboshop123"
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
    rabbitmq = {
      secret = "roboshop-dev"
      value = {
        username = "roboshop"
        password = "roboshop123"
      }
    }
    mysql = {
      secret = "roboshop-dev"
      value = {
        username = "root"
        password = "RoboShop@1"
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