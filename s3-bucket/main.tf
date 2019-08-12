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

  #destroy even if the bucket is not empty
  force_destroy = true
 
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

#objects to upload when there is change in content
resource "aws_s3_bucket_object" "file_upload" {
  bucket   = "tf-test-bucket-raghu"
  key      = "autoupload"
  source   = "/Users/rlokinen/Desktop/Backup/302-Kubernetes.pptx"
  etag     = "${filemd5("/Users/rlokinen/Desktop/Backup/302-Kubernetes.pptx")}"

}
