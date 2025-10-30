terraform {
  backend "s3" {
    bucket       = "terraform-state-lock-file999"
    key          = "state/oct"
    use_lockfile = true
    region       = "us-east-1"
  }
}