provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "Archu" {
  ami                     = "ami-0866a3c8686eaeeba"
  instance_type           = "t2.micro"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "archu-terraform555"
  acl    = "private"
}