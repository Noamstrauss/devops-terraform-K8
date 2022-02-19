output "Frontend_load_balancer_hostname" {
  value = kubernetes_ingress_v1.frontend.status.0.load_balancer.0.ingress.0.hostname
}
