output "trail_arn" {
  value = "${aws_cloudtrail.cloudtrail.arn}"
}

output "trail_name" {
  value = "${aws_cloudtrail.cloudtrail.id}"
}
