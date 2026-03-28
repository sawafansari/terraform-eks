module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"   # ✅ stable (no errors)

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version
  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  enable_irsa = true

  eks_managed_node_groups = {
    default = {
      min_size     = 2
      max_size     = 6
      desired_size = 2

      instance_types = ["t3.small"]
    }
  }
}
