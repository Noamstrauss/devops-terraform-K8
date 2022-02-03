resource "kubernetes_namespace" "namespace" {
for_each = var.apps_config3
  metadata {
    name = each.value.name
    labels = {
      name  = each.value.name
      tier  = each.value.labels.tier
      owner = each.value.labels.owner
    }
    annotations = {
      "serviceClass"       = each.value.annotations.serviceClass
      "loadBalancer/class" = each.value.annotations.loadBalancer
    }
  }
}