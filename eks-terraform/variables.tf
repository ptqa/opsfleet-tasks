variable "cluster_name" {
  description = "Cluster name for EKS"
  type        = string
  default     = "opsfleet"
}

variable "bucket_name" {
  description = "S3 bucket name for access"
  type        = string
  default     = "ptqa-opsfleet"
}

variable "vpc_id" {
  description = "VPC ID to use for EKS cluster"
  type        = string
  default     = "vpc-08c5e30a0899aef21"
}

variable "subnet_ids" {
  description = "A list of subnets to use for EKS cluster"
  type        = list(string)
  default     = ["subnet-01729fb7f1767abd1", "subnet-0099868c9d6986d71", "subnet-0e99f9e31c8b3aec4", "subnet-0d5c2916714620e29"]
}
