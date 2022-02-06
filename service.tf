
resource "kubernetes_service_v1" "database" {
    for_each = {
    for x, z in var.apps_config3 : x => z
    if x != "frontend"
  }
  metadata {
    name = format("%s-service", each.key)
    namespace = each.value.name
    labels = {
      env = each.value.labels.env
      tier = each.value.labels.tier
      serviceclass = each.value.annotations.serviceClass
    }
  }
  spec {
    selector = {
      tier = each.value.labels.tier
    }
    port {
      port = each.value.acl.port
      target_port = each.value.acl.targetport
      protocol = each.value.acl.protocol
    }
  }
}

