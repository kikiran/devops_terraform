//fetching s3 bucket
resource "aws_s3_bucket" "dev" {
      bucket = "state-file-lock-dynamodb"
}

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
    name = "aws_dynamodb_table_state_lock"
    hash_key = "LockID"
    read_capacity = 20
    write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}