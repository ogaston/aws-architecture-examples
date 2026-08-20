output "domain_name" {
  description = "Web Application Domain Name"
  value       = "${var.subdomain}.${var.domain_name}"
}

output "cloudfront_distribution_id" {
  description = "ID of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cdn.id
}

output "cloudfront_domain_name" {
  description = "CloudFront-assigned domain name (e.g. d123abc.cloudfront.net)"
  value       = aws_cloudfront_distribution.cdn.domain_name
}

output "s3_bucket_name" {
  description = "Name of the S3 bucket used as the CloudFront origin"
  value       = aws_s3_bucket.web_hosting_bucket.bucket
}

output "s3_bucket_arn" {
  description = "ARN of the S3 bucket used as the CloudFront origin"
  value       = aws_s3_bucket.web_hosting_bucket.arn
}
