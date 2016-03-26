#--------------------------------------------------------------
# Admin User outputs
#--------------------------------------------------------------
output "user_id" {
  value = "${aws_iam_user.adminSudo.id}"
}

output "user_arn" {
  value = "${aws_iam_user.adminSudo.arn}"
}

output "user_name" {
  value = "${aws_iam_user.adminSudo.name}"
}

output "user_access_key_id" {
  value = "${aws_iam_access_key.sudoKey.id}"
}

output "user_access_key_secret" {
  value = "${aws_iam_access_key.sudoKey.secret}"
}

#--------------------------------------------------------------
# Developer User outputs
#--------------------------------------------------------------
output "user_id" {
  value = "${aws_iam_user.developer.id}"
}

output "user_arn" {
  value = "${aws_iam_user.developer.arn}"
}

output "user_name" {
  value = "${aws_iam_user.developer.name}"
}

output "user_access_key_id" {
  value = "${aws_iam_access_key.developerKey.id}"
}

output "user_access_key_secret" {
  value = "${aws_iam_access_key.developerKey.secret}"
}