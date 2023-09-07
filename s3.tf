resource "aws_s3_bucket" "bucket_name" { // <= TODO - Enter variable value.
  bucket = var.s3_bucket

  force_destroy = true

  tags = {
    Name        = var.s3_tag_name
    Environment = var.s3_tag_environment
  }
}

resource "aws_s3_object" "object" {
  bucket       = aws_s3_bucket.bucket_name.id // <= TODO - Enter variable value.
  key          = var.s3_object_key
  acl          = "private"
  source       = var.s3_object_file_path
  etag         = filemd5(var.s3_object_file_path)
}