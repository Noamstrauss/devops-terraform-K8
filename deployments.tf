resource "kubernetes_deployment" "deployment"  {
     for_each = var.apps_config3
  metadata {
    name = each.value.name
    namespace = each.value.name
    labels = {
      name = each.value.name
      tier = each.value.labels.tier
    }
  }
  spec {
    selector {
      match_labels = {
        name = each.value.name
        tier = each.value.labels.tier
      }
    }
    template {
      metadata {
        name = each.value.name
        labels = {
          name = each.value.name
          tier = each.value.labels.tier
        }
      }
      spec {
        container {
          name  = each.value.name
          image = each.value.image
          image_pull_policy = each.value.imagePullPolicy
          env {
            name = "DB_PASSWORD"
            value_from {
              secret_key_ref {
                name = "db-secret"
                key = "password"
              }
            }
          }
        resources {
          limits = {
            memory = each.value.limit.max_memory
            cpu = each.value.limit.max_cpu
                   }
          requests = {
            memory = each.value.limit.req_memory
            cpu = each.value.limit.req_cpu
          }
       }

        }

      }

      }
    }
  }

