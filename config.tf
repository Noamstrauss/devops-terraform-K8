provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "kb" {
  source = "./modules/kb"
}
