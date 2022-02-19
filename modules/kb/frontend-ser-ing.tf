resource "kubernetes_service_v1" "frontend" {
  metadata {
    name = "frontend-service"
    namespace = var.apps_config3.frontend.name
      labels = {
      env = var.apps_config3.frontend.labels.env
      tier = var.apps_config3.frontend.labels.tier
      serviceclass = var.apps_config3.frontend.annotations.serviceClass
      loadBalancer = var.apps_config3.frontend.annotations.loadBalancer
    }
  }
  spec {
    selector = {
      name = var.apps_config3.frontend.name
    }
    port {
      port = var.apps_config3.frontend.acl.port
      target_port = var.apps_config3.frontend.acl.targetport
      protocol = var.apps_config3.frontend.acl.protocol
    }
    type = "NodePort"
  }
}



resource "kubernetes_ingress_v1" "frontend" {
  wait_for_load_balancer = true
  metadata {
    name = "frontend-ingress"
    namespace = var.apps_config3.frontend.name
    labels = {
      loadBalancer = var.apps_config3.frontend.annotations.loadBalancer
      tier = var.apps_config3.frontend.labels.tier
      env = var.apps_config3.frontend.labels.env
    }
     annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service_v1.frontend.metadata.0.name
              port {
                number = kubernetes_service_v1.frontend.spec.0.port.0.port
              }
            }
          }
        }
      }
    }
  }
}

