# Managing secrets with SOPS

This repository serves as a demonstration of managing Kubernetes secrets using SOPS (Secrets OPerationS) and AWS Key Management Service (KMS). It is worth mentioning that SOPS is supported by well-known GitOps tools like FluxCD as well. See [guide](https://fluxcd.io/flux/guides/mozilla-sops/).

## Pre-requisites

* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/) and [aws-cli configured](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html)
* You must have [sops installed](https://github.com/getsops/sops)
* You must have [kubectl installed](https://kubernetes.io/docs/tasks/tools/)

## Secrets workflow

* Export KMS key id as ENV variable `export SOPS_KMS_ARN="arn:aws:kms:us-west-2:996932812583:key/ac477b14-f969-4100-9788-8139e823b67b"`
* Create k8s secret resource file with sops `sops secret.yml`
```
apiVersion: v1
kind: Secret
metadata:
    name: mysecret
type: Opaque
data:
    username: YWRtaW4=
    password: MWYyZDFlMmU2N2Rm
```
* Create k8s resource with `$ sops -d secret.yml | kubectl apply -f -`
* Refer to secrets in you deployment spec as shown in `example.yml`
* Commit all files to git and don't worry about storing secrets in git anymore

## Alternative solutions

* [sealed-secrets](https://github.com/bitnami-labs/sealed-secrets) provides a way to store encrypted secrets in git in a different manner, but has no AWS KMS support
* [aws-env](https://github.com/telia-oss/aws-env) supports stoing encrypted secrets in git, has support for AWS KMS, AWS Secrets Manager and more
