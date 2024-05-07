terraform {
  backend "s3" {
    bucket = "terraform-backend"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

