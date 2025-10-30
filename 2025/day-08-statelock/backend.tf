terraform {
  backend "s3" {
    bucket = "terraform-state-lock-file999"
    use_lockfile = true
  }
}