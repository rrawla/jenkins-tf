resource "aws_s3_bucket" "s3-good-example" {
  bucket = "etrade.poc.test-bucket"
  acl    = "private"
   versioning {
    enabled = true
  }
  tags = {
    Name = "poc bucket"
    env = "dev"
  }
  logging {
    target_bucket = "etrade.poc.test.bucket"
    target_prefix = "log/"
  }
   server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = "AES256"
      }
    }
  }
}
resource "aws_s3_bucket_public_access_block" "good-example-access-block" {
  bucket = aws_s3_bucket.s3-good-example.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

