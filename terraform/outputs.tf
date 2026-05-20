output "bucket_name" {
  description = "The S3 bucket name deployed by Terraform."
  value       = aws_s3_bucket.deployment_bucket.bucket
}
