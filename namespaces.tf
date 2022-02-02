resource "kubernetes_namespace" "namespace" {
for_each = {for inst in var.apps_config2:  inst.name => inst}
  metadata {
    name = each.value["name"]
    labels = {
      name  = each.value["name"]
      tier  = each.value["tier"]
      owner = each.value["owner"]
    }
    annotations = {
      "serviceClass"       = each.value["serviceClass"]
      "loadBalancer/class" = each.value["loadBalancer"]
    }
  }
}