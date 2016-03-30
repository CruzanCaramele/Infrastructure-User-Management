variable "github_token" {
	description = "access key to github account"
	default     = "{{env `GITHUB_TOKEN`}}"
}

variable "github_organization" {
	description = "github organiztion"
	default     = "{{env `GITHUB_ORGANIZATION`}}"
}