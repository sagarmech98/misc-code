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
        REDIS_HOST="redis-dev.vidyapractice.online"
        CATALOGUE_HOST="catalogue-dev.vidyapractice.online"
        CATALOGUE_PORT=8080
      }
    }
    catalogue = {
      secret = "roboshop-dev"
      value = {
        MONGO       = "true"
        MONGO_URL   = "mongodb://mongodb-dev.vidyapractice.online:27017/catalogue"
        DB_TYPE     = "mongo"
        APP_GIT_URL = "https://github.com/roboshop-devops-project-v3/catalogue"
        DB_HOST     = "mongodb-dev.vidyapractice.online"
        SCHEMA_FILE = "db/master-data.js"
      }
    }
    user = {
      secret = "roboshop-dev"
      value = {
       MONGO     = "true"
       REDIS_URL="redis://redis-dev.vidyapractice.online:6379"
       MONGO_URL="mongodb://mongodb-dev.vidyapractice.online:27017/users"
      }
    }
    shipping = {
      secret = "roboshop-dev"
      value = {
        CART_ENDPOINT = "cart-dev.vidyapractice.online:8080"
        DB_HOST       = "mysql-dev.vidyapractice.online"
        DB_USER       = "root"
        DB_PASS       = "RoboShop@1"
        username      = "root"
        password      = "RoboShop@1"
        DB_TYPE       = "mysql"
        APP_GIT_URL   = "https://github.com/roboshop-devops-project-v3/shipping"
      }
    }
    payment = {
      secret = "roboshop-dev"
      value = {
        CART_HOST="cart-dev.vidyapractice.online"
        CART_PORT="8080"
        USER_HOST="user-dev.vidyapractice.online"
        USER_PORT="8080"
        AMQP_HOST="rabbitmq-dev.vidyapractice.online"
        AMQP_USER="roboshop"
        AMQP_PASS="roboshop123"
      }
    }

    frontend = {
      secret = "roboshop-dev"
      value = {
        catalogue_url = "http://catalogue-dev.vidyapractice.online:8080/"
        user_url      = "http://user-dev.vidyapractice.online:8080/"
        cart_url      = "http://cart-dev.vidyapractice.online:8080/"
        payment_url   = "http://payment-dev.vidyapractice.online:8080/"
        shipping_url  = "http://shipping-dev.vidyapractice.online:8080/"
        CATALOGUE_HOST = "catalogue-dev.vidyapractice.online"
        CATALOGUE_PORT = 8080
        USER_HOST      = "user-dev.vidyapractice.online"
        USER_PORT      = 8080
        CART_HOST      = "cart-dev.vidyapractice.online"
        CART_PORT      = 8080
        SHIPPING_HOST  = "shipping-dev.vidyapractice.online"
        SHIPPING_PORT  = 8080
        PAYMENT_HOST   = "payment-dev.vidyapractice.online"
        PAYMENT_PORT   = 8080
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