resource "kubernetes_namespace" "namespace" {
  for_each = var.apps_config2
  metadata {
    name = each.value.name
    labels = {
      name  = each.value.name
      tier  = each.value.tier
      owner = each.value.owner
    }
    annotations = {
      "serviceClass"       = each.value.serviceClass
      "loadBalancer/class" = each.value.loadBalancer
    }
  }
}