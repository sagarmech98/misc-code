ui = true
api_addr = "http://vault.vidyapractice.online:8200"

storage "file" {
  path = "/opt/vault/data"
}

listener "tcp" {
 address = "0.0.0.0:8200"
 tls_disable = 1
}