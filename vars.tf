variable REGION {
  default = "ap-south-1"
}

variable "bucket_name" {
  description = "name of s3 bucket for app data"
  type        = string
}