provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "b1" {
  bucket = "bucket-19-09-22"
}

# resource "aws_s3_bucket_public_access_block" "example" {
#   bucket = aws_s3_bucket.b1.id

#   block_public_acls       = true
#   block_public_policy     = true
#   ignore_public_acls      = true
#   restrict_public_buckets = true
# }

resource "aws_s3_bucket_policy" "my-policy" {
  bucket = aws_s3_bucket.b1.id
  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "Policy1464968545158",
    "Statement" : [
      {
        "Sid" : "",
        "Effect" : "Allow",
        "Principal" : "*",
        "Action" : "s3:PutObject",
        "Resource" : [
          "arn:aws:s3:::bucket-19-09-22/*.jpg",
          "arn:aws:s3:::bucket-19-09-22/*.png",
          "arn:aws:s3:::bucket-19-09-22/*.gif"
        ]
      },
      {
        "Sid" : "",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:PutObject",
        "NotResource" : [
          "arn:aws:s3:::bucket-19-09-22/*.jpg",
          "arn:aws:s3:::bucket-19-09-22/*.png",
          "arn:aws:s3:::bucket-19-09-22/*.gif"
        ]
      }
    ]
  })

}


