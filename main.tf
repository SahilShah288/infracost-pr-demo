terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                      = "us-east-1"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  access_key                  = "mock_access_key"
  secret_key                  = "mock_secret_key"
}

resource "aws_instance" "web_server" {
  ami           = "ami-005e54dee72cc1d00"
  instance_type = "t3.micro"

  root_block_device {
    volume_size = 50
    volume_type = "gp3"
  }

  tags = {
    Environment = "production"
    Service     = "web-app"
  }
}