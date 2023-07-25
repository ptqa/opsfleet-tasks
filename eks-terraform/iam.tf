#resource "aws_iam_policy" "s3" {
#  name        = "S3Policy"
#  description = "Permissions that are required to access S3"
#  policy      = data.aws_iam_policy_document.s3.json
#}
#
#data "aws_iam_policy_document" "s3_assume" {
#  statement {
#    actions = ["sts:AssumeRoleWithWebIdentity"]
#    principals {
#      type        = "Federated"
#      identifiers = [aws_iam_openid_connect_provider.this.arn]
#    }
#    condition {
#      test     = "StringEquals"
#      variable = "oidc.eks.us-west-2.amazonaws.com/id/${local.oidc_id}:sub"
#      values   = ["system:serviceaccount:kube-system:s3"]
#    }
#    condition {
#      test     = "StringEquals"
#      variable = "oidc.eks.us-west-2.amazonaws.com/id/${local.oidc_id}:aud"
#      values   = ["sts.amazonaws.com"]
#    }
#    effect = "Allow"
#  }
#}
#
#resource "aws_iam_role" "s3" {
#  name               = "S3Role"
#  assume_role_policy = data.aws_iam_policy_document.s3_assume.json
#}
#
#resource "aws_iam_role_policy_attachment" "s3" {
#  policy_arn = aws_iam_policy.s3.arn
#  role       = aws_iam_role.s3.name
#}
