
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
    }


  }
}
resource "kubernetes_service_v1" "example1" {
  metadata {
    name = "stream-backend-service"
    namespace = "stream-backend"
  }
  spec {
    selector = {
      name         = "stream-backend"
    }
    port {
      port        = 80
    }


  }
}



