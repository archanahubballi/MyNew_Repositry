provider "aws" {
  region = "us-east-1"
}

module "ec2-instance" {
  source = "./modules/ec2-instance"
  ami_value = "ami-0e86e20dae9224db8"
  instance_type_value = "t2.micro"
  subnet_id_value = "subnet-05beeaab0851e17a2"
}
