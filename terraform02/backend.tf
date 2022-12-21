terraform {
  backend "s3" {
    bucket         = "lopihara"
    key            = "terraform/project1_state"
    region         = "eu-central-1"
    dynamodb_table = "terraform_state"
  }
}