aws_region = "ap-south-1"

cluster_name = "wandernest-eks"

vpc_name = "wandernest-vpc"

environment = "dev"

project_name = "wandernest"

ecr_repository = "wandernest-repository"

secret_name = "wandernest-login-secret"

vpc_cidr = "10.0.0.0/16"

availability_zones = [
  "ap-south-1a",
  "ap-south-1b"
]

public_subnets = [
  "10.0.1.0/24",
  "10.0.2.0/24"
]

private_subnets = [
  "10.0.11.0/24",
  "10.0.12.0/24"
]
cluster_version = "1.33"
