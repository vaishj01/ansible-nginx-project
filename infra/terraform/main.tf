module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source = "./modules/eks"
}

module "ecr" {
  source = "./modules/ecr"
}

module "iam" {
  source = "./modules/iam"
}

module "alb_controller" {
  source = "./modules/alb-controller"
}

module "secrets_manager" {
  source = "./modules/secrets-manager"
}