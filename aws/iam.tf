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