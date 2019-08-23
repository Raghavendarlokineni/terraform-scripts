output "user_arn" {
    value = "${aws_iam_user.user_creation.*.arn}"
}
