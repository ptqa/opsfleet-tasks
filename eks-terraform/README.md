# EKS cluster with Terraform

This repository facilitates the deployment of an EKS cluster using the Terraform. Notably, it also includes support for the EKS feature, [IAM roles for service accounts](https://docs.aws.amazon.com/eks/latest/userguide/iam-roles-for-service-accounts.html).

## Pre-requisites

* You must have an [Amazon Web Services (AWS) account](http://aws.amazon.com/) and [aws-cli configured](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-quickstart.html)
* You must have [terraform installed](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
* You must have [kubectl installed](https://kubernetes.io/docs/tasks/tools/)

## Creating a cluster

* Adjust variables in `variables.tf` to match your desired cluster/s3 bucket names and VPC settings
* Run `terraform apply`
* Get kubectl config `aws eks update-kubeconfig --region us-west-2 --name <cluster-name> --alias <cluster-name>`
* Re-run `terraform apply` to create kubernetes manifests

## Verification

Verify that cluster is running

```
$ kubectl cluster-info
Kubernetes control plane is running at https://B886F346B7EEC1C0785ED5DF7927102A.gr7.us-west-2.eks.amazonaws.com
CoreDNS is running at https://B886F346B7EEC1C0785ED5DF7927102A.gr7.us-west-2.eks.amazonaws.com/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

```

## Using IAM roles for SA

There is an example deployment configured in `example.yml` file. Deploy it with `kubectl apply -f example.yml`

Test it with:

```
$ kubectl exec -it deploy/s3-example -- bash
bash-4.2# aws s3 ls
2023-07-25 17:28:29 ptqa-opsfleet
```

If you would like to use same SA for you deployment then add `serviceAccountName: service-account-s3` to your deployment spec [as shown here](https://github.com/ptqa/opsfleet-tasks/blob/main/eks-terraform/example.yml#L16)
