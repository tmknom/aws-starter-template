resource "aws_s3_bucket" "cloudtrail" {
  bucket = "${var.bucket_name}"

  acl           = "private"
  force_destroy = false

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags {
    Name = "${var.bucket_name}"
  }

  lifecycle {
    prevent_destroy = true
  }
}
