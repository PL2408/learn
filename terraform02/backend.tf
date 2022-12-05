terraform {
  backend "s3" {
    bucket         = "lopihara"
    key            = "terraform/progect1_state"
    region         = "eu-central-1"
    dynamodb_table = "terraform_state"
  }
}