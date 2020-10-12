provider "aws" {
  version = "~> 3.0"
  region   = "ca-central-1"
  assume_role {
    role_arn     = "arn:aws:iam::005901988046:role/pipeline-services-terraform"
    session_name = "pipeline-services"
  }
}