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
  default     = "ptqa-opsfleet"
}

variable "subnet_ids" {
  description = "A list of subnets to use for EKS cluster"
  type        = list(string)
  default     = "ptqa-opsfleet"
}
