provider "aws" {
  region  = "us-east-1"
  #version = "~> 3.0"
}

provider "aws" {
  alias = "w2"
  region  = "us-west-2"
}


terraform {
  backend "s3" {
    # Lembre de trocar o bucket para o seu, não pode ser o mesmo nome
    bucket = "terraform-fernandostn"
    # dynamodb_table = "terraform-state-lock-dynamo"
    key    = "terraform-test.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}