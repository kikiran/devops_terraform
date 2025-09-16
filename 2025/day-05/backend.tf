terraform {
  backend "s3" {
    bucket       = "terraform-state-store-bucket009"
    key          = "rac/terraform.tfstate"
    dynamodb_table = "terraform-locks"
    use_lockfile = true
    region       = "us-east-1"

  }
}
