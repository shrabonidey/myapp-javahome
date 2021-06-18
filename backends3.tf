terraform {
  backend "s3" {
    bucket = "DeskFact-tf-state"
    key    = "DF/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dynamodb_table"
  }
}