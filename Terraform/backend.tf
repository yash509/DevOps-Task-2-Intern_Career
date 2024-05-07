terraform {
  backend "s3" {
    bucket = "unique name of your s3 bucket"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}

