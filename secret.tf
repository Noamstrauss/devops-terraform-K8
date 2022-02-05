resource "kubernetes_secret" "secret" {
  for_each = var.apps_config3
  metadata {
    name = "db-secret"
    namespace = each.value.name
  }

  data = {
    password = "YouWontGuessThis"
  }

  type = "kubernetes.io/basic-auth"
}
