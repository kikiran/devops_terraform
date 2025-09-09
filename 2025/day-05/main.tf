provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-store-bucket009"
}

resource "aws_s3_bucket_versioning" "terraform-state_version" {
  bucket = aws_s3_bucket.terraform-state.id

  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_dynamodb_table" "terraform-locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}
