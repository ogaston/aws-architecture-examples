locals {
  origin_id = "${var.bucket_name}-origin"

  common_tags = merge(
    {
      ProjectName = var.project_name != "" ? var.project_name : var.bucket_name
      Owner       = var.owner
      ManagedBy   = "terraform"
    },
    var.tags
  )
}

resource "aws_s3_bucket" "web_hosting_bucket" {
  bucket = var.bucket_name

}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.web_hosting_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.web_hosting_bucket.id
  key          = "index.html"
  source       = "${path.module}/${var.index_document_path}"
  etag         = filemd5("${path.module}/${var.index_document_path}")
  content_type = "text/html"
}

data "aws_iam_policy_document" "cloudfront_oac_access" {
  statement {
    sid    = "AllowCloudFrontServicePrincipalReadOnly"
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["cloudfront.amazonaws.com"]
    }

    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.web_hosting_bucket.arn}/*"]

    condition {
      test     = "StringEquals"
      variable = "AWS:SourceArn"
      values   = [aws_cloudfront_distribution.cdn.arn]
    }
  }
}

resource "aws_s3_bucket_policy" "web_hosting_bucket_policy" {
  bucket = aws_s3_bucket.web_hosting_bucket.id
  policy = data.aws_iam_policy_document.cloudfront_oac_access.json
}

