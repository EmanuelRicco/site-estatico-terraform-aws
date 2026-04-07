output "url" {
  value = "URL de acesso ao site: https://${aws_cloudfront_distribution.site-estatico-terraform-aws.domain_name}"
}