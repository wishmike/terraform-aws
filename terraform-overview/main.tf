provider "aws" {
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.38.0"
    }
  }
}

resource "aws_instance" "tf-ec2" {
  ami           = "ami-0742b4e673072066f"
  instance_type = "t2.micro"
  key_name      = "tim"    # write your pem file without .pem extension>
  tags = {
    "Name" = "tf-ec2"
  }
}

resource "aws_s3_bucket" "tf-s3" {
  bucket = "tim-tf-test-bucket-myfirstbucket"
  acl    = "private"
}
