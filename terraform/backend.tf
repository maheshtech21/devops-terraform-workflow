terraform {
  backend "s3" {
    bucket  = "mahesh-devops-tf"
    key     = "devopstf/vpc-infra/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
