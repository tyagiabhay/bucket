# Creating bucket with dynamic name
resource "aws_s3_bucket" "bucket" {
  bucket        = var.bucket_name
  force_destroy = true
  versioning {
    enabled = true
  }
}

# Adding policy to restrict file uploads for only .png, .jpg, .gif extensions. 
resource "aws_s3_bucket_policy" "my-policy" {
  bucket = var.bucket_name
  policy = jsonencode(
  {
    "Version" : "2012-10-17",
    "Id" : "Policy1464968545158",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:PutObject",
        "Resource" : [
          "arn:aws:s3:::${var.bucket_name}/*.jpg",
          "arn:aws:s3:::${var.bucket_name}/*.png",
          "arn:aws:s3:::${var.bucket_name}/*.gif"
        ]
      },
      {
        "Sid" : "",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:PutObject",
        "NotResource" : [
          "arn:aws:s3:::${var.bucket_name}/*.jpg",
          "arn:aws:s3:::${var.bucket_name}/*.png",
          "arn:aws:s3:::${var.bucket_name}/*.gif"
        ]
      }
    ]
  }
  )
}

