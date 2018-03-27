variable "cloudtrail_bucket" {
  # defined .envrc
}

module "cloudtrail" {
  source = "../../modules/cloudtrail"

  bucket_name = "${var.cloudtrail_bucket}"
}
