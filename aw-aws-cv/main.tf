terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "cv-bucket" {
  bucket = "s3-cv-bucket"
}

resource "aws_cloudfront_origin_access_control" "cloudfront-cv" {
  name = "aws_cloudfront_cv" 
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.cv-bucket.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront-cv.id
    origin_id = aws_s3_bucket.cv-bucket.id

  }

  viewer_certificate {
  cloudfront_default_certificate = true
}

     restrictions {
    geo_restriction {
      restriction_type = "none"
    }
    
  }

  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.cv-bucket.id

      forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }
  } 
}

data "aws_iam_policy_document" "origin_bucket_policy" {

statement {

  actions = ["s3:GetObject"]
  resources = ["${aws_s3_bucket.cv-bucket.arn}/*"]

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"] 
    }

   condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.s3_distribution.arn]
    }
}

}

resource "aws_s3_bucket_policy" "s3_policy" {
  bucket = aws_s3_bucket.cv-bucket.id
  policy = data.aws_iam_policy_document.origin_bucket_policy.json
  
}

resource "aws_s3_object" "cv_index" {
  bucket = aws_s3_bucket.cv-bucket.id
   key    = "index.html"
  source = "./index.html"
  content_type = "text/html"
}
