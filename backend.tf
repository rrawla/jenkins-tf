terraform {
  backend "s3" {
    bucket   = "rahul.jenkins.test"
    region   = "ca-central-1"
    //role_arn = "arn:aws:iam::005901988046:role/pipeline-services-terraform"
    key      = "terraform/pipeline-terraform.tfstate"
  }
}

