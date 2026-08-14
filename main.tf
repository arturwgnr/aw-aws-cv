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

resource "aws_s3_bucket" "cv-bucket-aw-1905" {
  bucket = "s3-cv-bucket-aw-1905"
}

resource "aws_s3_object" "s3_profile_pic" {
  bucket = aws_s3_bucket.cv-bucket-aw-1905.id
  key = "img/artur-pfp.jpeg"
  source = "./img/artur-pfp.jpeg"
  content_type = "image/jpeg"
}

resource "aws_cloudfront_origin_access_control" "cloudfront-cv" {
  name = "aws_cloudfront_cv" 
  origin_access_control_origin_type = "s3"
  signing_behavior = "always"
  signing_protocol = "sigv4"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.cv-bucket-aw-1905.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront-cv.id
    origin_id = aws_s3_bucket.cv-bucket-aw-1905.id

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
    target_origin_id = aws_s3_bucket.cv-bucket-aw-1905.id

      forwarded_values {
      query_string = false
      cookies { forward = "none" }
    }
  } 
}

data "aws_iam_policy_document" "origin_bucket_policy" {

statement {

  actions = ["s3:GetObject"]
  resources = ["${aws_s3_bucket.cv-bucket-aw-1905.arn}/*"]

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
  bucket = aws_s3_bucket.cv-bucket-aw-1905.id
  policy = data.aws_iam_policy_document.origin_bucket_policy.json
  
}

resource "aws_s3_object" "cv_index" {
  bucket = aws_s3_bucket.cv-bucket-aw-1905.id
   key    = "index.html"
  source = "./index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "cv_projects" {
  bucket = aws_s3_bucket.cv-bucket-aw-1905.id
  key = "projects.html"
  source = "./projects.html"
  content_type = "text/html"
}

resource "aws_s3_object" "og_thumbnail" {
  bucket       = aws_s3_bucket.cv-bucket-aw-1905.id
  key          = "thumbnails/arturw.png"
  source       = "./thumbnails/arturw.png"
  content_type = "image/png"
}
