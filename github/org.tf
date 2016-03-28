#--------------------------------------------------------------
# Provider
#--------------------------------------------------------------
provider "github" {
	token       = "${var.github_token}"
	organiztion = "${var.github_organization}" 
}

#--------------------------------------------------------------
# Team
#--------------------------------------------------------------
resource "github_team" "test_team" {
	name = "test_team"
	description = "a new team for the organiztion"
}

#--------------------------------------------------------------
# membership
#--------------------------------------------------------------
resource "github_team_membership" "test_user_test_team" {
	team_id  = "${github_team.test_team.id}"
	username = "CruzanCaramele"
	role     = "member"
}