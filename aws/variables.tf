variable "aws_access_key" {
	description = "access key to aws account"
	default     = "{{env `AWS_ACCESS_KEY_ID`}}"
}

variable "aws_secret_key" {
	description = "secret key to aws account"
	default     = "{{env `AWS_SECRET_ACCESS_KEY`}}"
}