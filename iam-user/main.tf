provider "aws" {
    version = "~> 2.22"
    region  = "us-east-1"
}
resource "aws_iam_user" "user_creation" {
  count = "${length(var.username)}"
  name  = "${element(var.username,count.index)}"
}
