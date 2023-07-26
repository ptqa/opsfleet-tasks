resource "kubernetes_manifest" "s3_service_account" {
  manifest = {
    "apiVersion" = "v1"
    "kind"       = "ServiceAccount"
    "metadata" = {
      "annotations" = {
        "eks.amazonaws.com/role-arn" = aws_iam_role.s3.arn
      }
      "name"      = "service-account-s3"
      "namespace" = "default"
    }
  }
}
