
resource "aws_iam_service_linked_role" "autoscaling" {
    aws_service_name = "autoscaling.amazonaws.com"
    description = "A service linked role for autoscaling"
    custom_suffix = local.name
  

}

#Outputs for the IAM service linked Role

output "service_linked_role_arn" {
  value = aws_iam_service_linked_role.autoscaling.arn
}