resource "kubernetes_service_v1" "instance" {
  for_each = var.apps_config3
  metadata {
    name = each.value.name
    namespace = each.value.name
  }
  spec {
    selector = {
      tier     = each.value.labels.tier
    }
    port {
      name = "http"
      port        = each.value.acl.port
      target_port = each.value.acl.targetport
      protocol = each.value.acl.protocol
    }
  }
}

