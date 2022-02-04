
resource "kubernetes_service_v1" "instance" {
  for_each = var.apps_config3
  metadata {
    name = each.value.name
    namespace = each.value.name
  }
  spec {
    selector = {
      name     = each.value.name
    }
    port {
      name = "http"
      port        = each.value.acl.port
      target_port = each.value.acl.targetport
    }
     port {
      name = "https"
      port        = "443"
      target_port = "443"
    }
  }
}

