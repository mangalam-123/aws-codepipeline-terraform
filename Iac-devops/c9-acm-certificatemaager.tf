# Certificate related config in ACM in AWS

module "acm" {
  source  = "terraform-aws-modules/acm/aws"
  version = "3.4.1"
  domain_name = trimsuffix(data.aws_route53_zone.mydomain.name, ".")
  zone_id = data.aws_route53_zone.mydomain.zone_id

  subject_alternative_names = [var.dns_name]

  tags = local.common_tags
}

#Output the arn for the certificate
output "this_acm_certificate_arn" {
description = "This giver the arn for the certificate"
value = module.acm.acm_certificate_arn
}
  
