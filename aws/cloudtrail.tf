#--------------------------------------------------------------
# CloudTrail
#--------------------------------------------------------------
resource "aws_cloudtrail" "foobar" {
    name = "tf-trail-foobar"
    s3_bucket_name = "${aws_s3_bucket.foobarloo.id}"
    s3_key_prefix = "/prefix"
    include_global_service_events = false
}

resource "aws_s3_bucket" "foobarloo" {
    bucket = "tf-test-trailbar"
    force_destroy = true
    policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::tf-test-trailbar"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::tf-test-trailbar/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}

#--------------------------------------------------------------
# Notifications and Subscription
#--------------------------------------------------------------
resource "aws_sns_topic" "ActivitiesUpdates" {
  name = "ActivitiesUpdates"
}

resource "aws_sqs_queue" "user_updates_queue" {
    name = "user-updates-queue"
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
    topic_arn = "${aws_sns_topic.ActivitiesUpdates.arn}"
    protocol  = "sqs"
    endpoint  = "${aws_sqs_queue.user_updates_queue.arn}"
}