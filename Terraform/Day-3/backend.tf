terraform {
  backend "s3" {
    bucket = "archu-terraform-test555"
    key    = "archu/terraform.tfstate"
    region = "us-east-1"
  }
}
