#locals {
#  oidc    = module.eks.identity[0]["oidc"][0]["issuer"]
#  oidc_id = element(split("/", local.oidc), length(split("/", local.oidc)) - 1)
#}
#
#output "oidc" {
#  value = local.oidc
#}
#
#output "oidc_id" {
#  value = local.oidc_id
#}
#
#resource "aws_iam_openid_connect_provider" "this" {
#  url            = local.oidc
#  client_id_list = ["sts.amazonaws.com"]
#
#  thumbprint_list = ["9e99a48a9960b14926bb7f3b02e22da2b0ab7280"]
#}
