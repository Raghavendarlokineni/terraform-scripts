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
 
  lifecycle_rule {
    enabled = true
    transition {
      days           = 30
      storage_class = "STANDARD_IA"
    }
    transition {
      days           = 60
      storage_class  = "GLACIER"
    }
    expiration {
      days = 90
    }
  } 
 
  tags = {
    Name = "Testing Bucket" 
  }
}

resource "aws_s3_bucket_object" "file_upload" {
  bucket   = "tf-test-bucket-raghu"
  key      = "autoupload"
  source   = "FILE-PATH"
  etag     = "${filemd5("FILE-PATH")}"

}
