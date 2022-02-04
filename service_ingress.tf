/*
resource "kubernetes_service_v1" "example" {
  metadata {
    name = "stream-frontend-service"
    namespace = "stream-frontend"
  }
  spec {
    selector = {
      name         = "stream-frontend"
    }
    port {
      port        = 80
      target_port = 5000
    }


  }
}

resource "kubernetes_ingress_v1" "example" {
  wait_for_load_balancer = false
  metadata {
    name = "example"
    namespace = "stream-frontend"
  }
  spec {
    rule {
      http {
        path {
          path = "*/
/*"
          backend {
            service {
              name = "stream-frontend-service"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
*/
