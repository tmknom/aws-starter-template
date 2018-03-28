resource "aws_cloudtrail" "cloudtrail" {
  name           = "${var.trail_name}"
  s3_bucket_name = "${var.bucket_name}"

  # Enables logging for the trail. Setting this to false will pause logging.
  enable_logging = true

  # Specifies whether the trail is created in the current region or in all regions.
  is_multi_region_trail = true

  # Specifies whether the trail is publishing events from global services such as IAM to the log files.
  include_global_service_events = true

  # Specifies whether log file integrity validation is enabled.
  enable_log_file_validation = true

  depends_on = [
    "aws_s3_bucket_policy.cloudtrail",
  ]
}
