resource "aws_s3_bucket" "b" {
  bucket = "s3-bucket-zype"
  acl    = "private"

  tags = {
    Name        = "zype"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket-block" {
  bucket = aws_s3_bucket.b.id

  block_public_acls         = true
  block_public_policy       = true
  ignore_public_acls        = true
  restrict_public_buckets   = true
}

resource "aws_iam_user" "user" {
  name = "zype-ro"
}

resource "aws_iam_access_key" "user-ro" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "user_ro" {
  name = "zype-s3-user"
  user = aws_iam_user.user.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:s3:::s3-bucket-zype/*"
    }
  ]
}
EOF
}