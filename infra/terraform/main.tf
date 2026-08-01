module "vpc" {
  source = "./modules/vpc"

  project_name       = var.project_name
  environment        = var.environment
  vpc_name           = var.vpc_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

module "ecr" {
  source = "./modules/ecr"

  project_name    = var.project_name
  environment     = var.environment
  repository_name = var.ecr_repository
}

module "secrets_manager" {
  source = "./modules/secrets-manager"

  project_name = var.project_name
  environment  = var.environment
  secret_name  = var.secret_name
}
module "eks" {
  source = "./modules/eks"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  project_name    = var.project_name
  environment     = var.environment

  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnets

  depends_on = [
    module.vpc
  ]
}
module "iam" {
  source = "./modules/iam"

  cluster_name      = var.cluster_name
  project_name      = var.project_name
  environment       = var.environment
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider_url = module.eks.oidc_provider

  depends_on = [
    module.eks
  ]
}

module "alb_controller" {
  source = "./modules/alb-controller"

  cluster_name            = module.eks.cluster_name
  alb_controller_role_arn = module.iam.alb_controller_role_arn
  vpc_id                  = module.vpc.vpc_id
  aws_region              = var.aws_region

  depends_on = [
    module.eks,
    module.iam
  ]
}

resource "aws_secretsmanager_secret" "this" {
  name = var.secret_name

  tags = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}

resource "aws_secretsmanager_secret_version" "this" {
  secret_id = aws_secretsmanager_secret.this.id

  secret_string = jsonencode({
    username = "admin"
    password = "ChangeMe123!" # initial placeholder value only
  })

  lifecycle {
    ignore_changes = [secret_string] # Jenkins will update this value later; Terraform won't overwrite it
  }
}

