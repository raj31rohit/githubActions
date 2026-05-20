variable "region" {
  description = "AWS region where resources will be deployed."
  type        = string
}

variable "bucket_name" {
  description = "Name of the S3 bucket to create."
  type        = string
}
