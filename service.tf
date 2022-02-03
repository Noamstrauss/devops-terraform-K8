resource "kubernetes_service" "service" {
  for_each = var.apps_config3
  metadata {
    name      = each.value.name
    namespace = each.value.name
  }
  spec {
    port {
      name        = each.value.acl.portname
      port        = each.value.acl.port
      protocol    = each.value.acl.protocol
      target_port = each.value.acl.port
    }
  }
}