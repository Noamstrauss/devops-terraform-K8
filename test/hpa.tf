resource "kubernetes_service" "example" {
  for_each = var.apps_config3
  metadata {
    name = "terraform-example"
  }
  spec {
    selector = {
      app = each.value.name
    }
    port {
      port        = 8080
      target_port = 80
    }

  }
}