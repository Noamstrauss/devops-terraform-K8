resource "kubernetes_secret" "secret" {
  for_each = var.apps_config3
  metadata {
    name = "db-secret"
    namespace = each.value.name
    labels = {
      name = each.value.name
      tier = each.value.labels.tier
      env = each.value.labels.env
    }
  }

  data = {
    password = "YouWontGuessThis"
  }

  type = "Opaque"
}
