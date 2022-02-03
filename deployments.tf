#############################################################################
### Deployment manifests for 3 applications (frontend, backend, database) ###
### feel free to change anything and to implement any function or method  ###
#############################################################################

resource "kubernetes_deployment" "instance"  {
     for_each = var.apps_config3
  metadata {
    name      = each.value.name
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

