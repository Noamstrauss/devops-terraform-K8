resource "kubernetes_horizontal_pod_autoscaler" "hpa" {
  for_each = var.apps_config3
  metadata {
    name = format("%s-hpa", each.value.name)
    namespace = each.value.name
  }

  spec {
    max_replicas = 3
    min_replicas = 2

    target_cpu_utilization_percentage = 70

    scale_target_ref {
      api_version = "apps/v1"
      kind        = "Deployment"
      name        = each.value.name
    }
  }
}