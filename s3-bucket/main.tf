provider "aws" {
  version = "~> 2.22"
  region  = "us-east-1"
}

resource "aws_s3_bucket" "testBucket" {
  bucket  = "tf-test-bucket-raghu"
  acl     = "private"

  versioning {
    enabled = true
  }
  tags {
    Name = "Testing Bucket"
  }
}
