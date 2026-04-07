output "url" {
  value = "URL de acesso ao site: ${aws_s3_bucket.site-estatico-terraform-aws.website_endpoint}"
}