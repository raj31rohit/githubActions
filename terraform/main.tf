resource "aws_s3_bucket" "deployment_bucket" {
  bucket = var.bucket_name

  acl = "private"

  lifecycle_rule {
    enabled = true

    abort_incomplete_multipart_upload_days = 7

    expiration {
      days = 365
    }
  }

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_s3_bucket_public_access_block" "deployment_bucket_block" {
  bucket = aws_s3_bucket.deployment_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

