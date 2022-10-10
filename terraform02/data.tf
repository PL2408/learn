# Get my public IP
data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}