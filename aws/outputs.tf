#--------------------------------------------------------------
# Admin User outputs
#--------------------------------------------------------------
output "admin_id" {
  value = "${aws_iam_user.adminSudo.id}"
}

output "admin_arn" {
  value = "${aws_iam_user.adminSudo.arn}"
}

output "admin_name" {
  value = "${aws_iam_user.adminSudo.name}"
}

output "admin_access_key_id" {
  value = "${aws_iam_access_key.sudoKey.id}"
}

output "admin_access_key_secret" {
  value = "${aws_iam_access_key.sudoKey.secret}"
}

#--------------------------------------------------------------
# Developer User outputs
#--------------------------------------------------------------
output "developer_id" {
  value = "${aws_iam_user.developer.id}"
}

output "developer_arn" {
  value = "${aws_iam_user.developer.arn}"
}

output "developer_name" {
  value = "${aws_iam_user.developer.name}"
}

output "developer_access_key_id" {
  value = "${aws_iam_access_key.developerKey.id}"
}

output "developer_access_key_secret" {
  value = "${aws_iam_access_key.developerKey.secret}"
}