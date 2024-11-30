terraform {
  backend "s3" {
    bucket         = "gt-bucket-terraform"
    key            = "w7/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}