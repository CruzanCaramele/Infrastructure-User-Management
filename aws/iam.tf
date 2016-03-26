#--------------------------------------------------------------
# Provider
#--------------------------------------------------------------
provider "aws" {
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
	region     = "us-east-1" 
}

#--------------------------------------------------------------
# User(s)
#--------------------------------------------------------------
resource "aws_iam_user" "adminSudo" {
	name = "adminSudo"
	path = "/"
}

resource "aws_iam_user" "developer" {
	name = "developer"
	path = "/"
}

#--------------------------------------------------------------
# Access key(s)
#--------------------------------------------------------------
resource "aws_iam_access_key" "sudoKey" {
	user = "${aws_iam_user.adminSudo.name}"
}

resource "aws_iam_access_key" "developerKey" {
	user = "${aws_iam_user.developer.name}"
}

#--------------------------------------------------------------
# Group(s)
#--------------------------------------------------------------
resource "aws_iam_group" "adminSudoers" {
	name = "adminSudoers"
	path = "/"
}

resource "aws_iam_group" "developers" {
	name = "developers"
	path = "/"
}

#--------------------------------------------------------------
# Group Policies/Permissions
#--------------------------------------------------------------
resource "aws_iam_group_policy" "adminPolicy" {
	name   = "adminPolicy"
	group  = "${aws_iam_group.adminSudoers.id}"
	policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_group_policy" "developersPolicy" {
	name   = "developersPolicy"
	group  = "${aws_iam_group.developers.id}"
	policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "NotAction": "iam:*",
      "Resource": "*"
    }
  ]
}
EOF
}

#--------------------------------------------------------------
# Group Memberships
#--------------------------------------------------------------
resource "aws_iam_group_membership" "sudoMembers" {
	name  = "sudoMembers"
	users = [
		"${aws_iam_user.adminSudo.name}"
	]
	group = "${aws_iam_group.adminSudoers.name}"
}

resource "aws_iam_group_membership" "developerMembers" {
	name  = "developerMembers"
	users = [
		"${aws_iam_user.developer.name}"
	]
	group = "${aws_iam_group.developers.name}"
}

