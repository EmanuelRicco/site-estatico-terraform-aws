resource "aws_s3_bucket" "site-estatico-terraform-aws" {
  bucket = "site-estatico-terraform-aws"
  tags = {
    Name = "site-estatico"
  }
}

resource "aws_s3_bucket_public_access_block" "site-estatico-terraform-aws" {
  bucket = aws_s3_bucket.site-estatico-terraform-aws.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "site-estatico-terraform-aws" {
  bucket = aws_s3_bucket.site-estatico-terraform-aws.id

  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_policy" "site-estatico-terraform-aws" {
  bucket = aws_s3_bucket.site-estatico-terraform-aws.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid       = "PublicReadGetObject"
      Effect    = "Allow"
      Principal = "*"
      Action    = "s3:GetObject"
      Resource  = "${aws_s3_bucket.site-estatico-terraform-aws.arn}/*"
    }]
  })

  depends_on = [aws_s3_bucket_public_access_block.site-estatico-terraform-aws]
}

resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.site-estatico-terraform-aws.id
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
  etag         = filemd5("./index.html")
}

resource "aws_s3_object" "error_html" {
  bucket       = aws_s3_bucket.site-estatico-terraform-aws.id
  key          = "error.html"
  source       = "./error.html"
  content_type = "text/html"
  etag         = filemd5("./error.html")
}