output "url" {
  value = "URL de acesso ao site: http://${aws_s3_bucket_website_configuration.site-estatico-terraform-aws.website_endpoint}"
}