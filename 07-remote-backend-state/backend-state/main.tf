provider "aws" {
    region = "us-east-1"
}

# S3 Bucket
resource "aws_s3_bucket" "enterprise_backend_state" {
    bucket = "dev-applications-backend-state-karishmadamania"
    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.enterprise_backend_state.id
  versioning_configuration {
    status = "Enabled"
  }
}
 
resource "aws_s3_bucket_server_side_encryption_configuration" "example" {
  bucket = aws_s3_bucket.enterprise_backend_state.bucket
 
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm     = "AES256"
    }
  }
}

# Locking - DyanmoDB table

resource "aws_dynamodb_table" "enterprise_backend_lock"{
    name = "dev_application_lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
        name = "LockID"
        type = "S"

    }
}