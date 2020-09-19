terraform {
  backend "s3" {
    bucket = "rahul.jenkins.test"
    region = "ca-central-1"
    key    = "terraform/terraform.tfstate"
  }
}

