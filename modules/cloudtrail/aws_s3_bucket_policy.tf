resource "aws_s3_bucket_policy" "cloudtrail" {
  bucket = "${aws_s3_bucket.cloudtrail.id}"
  policy = "${data.template_file.bucket_policy.rendered}"
}

data "template_file" "bucket_policy" {
  template = "${file("${path.module}/bucket_policy.json.tpl")}"

  vars {
    bucket_name = "${aws_s3_bucket.cloudtrail.id}"
  }
}
