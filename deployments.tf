#############################################################################
### Deployment manifests for 3 applications (frontend, backend, database) ###
### feel free to change anything and to implement any function or method  ###
#############################################################################

resource "kubernetes_deployment" "instance"  {
     for_each = {for inst in var.apps_config2:  inst.name => inst}
  metadata {
    name      = each.value["name"]
    namespace = each.value["name"]
    labels = {
      name = each.value["name"]
      tier = each.value["tier"]
    }
  }
  spec {
    selector {
      match_labels = {
        name = each.value["name"]
        tier = each.value["tier"]
      }
    }
    template {
      metadata {
        name = each.value["name"]
        labels = {
          name = each.value["name"]
          tier = each.value["tier"]
        }
      }
      spec {

        container {
          name  = each.value["name"]
          image = each.value["image"]
          imagePullPolicy = each.value["imagePullPolicy"]

        resources {
          limits = {
            memory = each.value["max_memory"]
            cpu = each.value["max_cpu"]
                   }
          requests = {
            memory = each.value["req_memory"]
            cpu = each.value["req_cpu"]
          }
       }

        }

      }

      }
    }
  }

