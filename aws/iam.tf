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
resource "aws_iam_user" "admin-sudo" {
	name = "admin-sudo"
	path = "/"
}

resource "aws_iam_user" "developer" {
	name = "developer"
	path = "/"
}

#--------------------------------------------------------------
# Access key(s)
#--------------------------------------------------------------
resource "aws_iam_access_key" "sudo-key" {
	user = "${aws_iam_user.admin-sudo.name}"
}

resource "aws_iam_access_key" "developer-key" {
	user = "${aws_iam_user.developer.name}"
}

#--------------------------------------------------------------
# Group(s)
#--------------------------------------------------------------
resource "aws_iam_group" "admin-sudoers" {
	name = "admin-sudoers"
	path = "/"
}

resource "aws_iam_group" "developers" {
	name = "developers"
	path = "/"
}

#--------------------------------------------------------------
# Group Policies/Permissions
#--------------------------------------------------------------

