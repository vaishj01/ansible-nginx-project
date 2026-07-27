module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.3.1"

  name               = var.cluster_name
  kubernetes_version = "1.33"

  endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  enable_cluster_creator_admin_permissions = true

  addons = {
  vpc-cni = {
    most_recent = true
  }

  kube-proxy = {
    most_recent = true
  }

  coredns = {
    most_recent = true
  }
}

  eks_managed_node_groups = {
  default = {
    name = "wandernest-node-group"

    instance_types = ["t3.micro"]

    desired_size = 2
    min_size     = 2
    max_size     = 2

    capacity_type = "ON_DEMAND"

    ami_type = "AL2023_x86_64_STANDARD"
  }
}

  tags = {
    Project = "WanderNest"
  }
}