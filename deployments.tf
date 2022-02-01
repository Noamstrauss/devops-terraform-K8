#############################################################################
### Deployment manifests for 3 applications (frontend, backend, database) ###
### feel free to change anything and to implement any function or method  ###
#############################################################################

resource "kubernetes_deployment" "instance"  {
  for_each = var.apps_config

  metadata {
    name      = each.value.name.name
    namespace = each.value.name.name
    labels = {
      name = each.value.label.name
      tier = each.value.label.tier
    }
  }
  spec {
    selector {
      match_labels = {
        name = each.value.label.name
        tier = each.value.label.tier
      }
    }
    template {
      metadata {
        name = each.value.name.name
        labels = {
          name = each.value.label.name
          tier = each.value.label.tier
        }
      }
      spec {

        container {
          name  = each.value.name.name
          image = each.value.name.image

        resources {
        memory: each.value.limits.memory
        cpu: each.value.limits.cpu
       }

        }

      }

      }
    }
  }


resource "kubernetes_deployment" "app2" {
  metadata {
    name      = var.app2_name
    namespace = var.app2_name
    labels = {
      name = var.app2_labels.name
      tier = var.app2_labels.tier
    }
  }
  spec {
    selector {
      match_labels = {
        name = var.app2_labels.name
        tier = var.app2_labels.tier
      }
    }
    template {
      metadata {
        name = var.app2_name
        labels = {
          name = var.app2_labels.name
          tier = var.app2_labels.tier
        }
      }
      spec {
        container {
          name  = var.app2_name
          image = "nginx"
        }
      }
    }
  }
}

resource "kubernetes_deployment" "app3" {
  metadata {
    name      = var.app3_name
    namespace = var.app3_name
    labels = {
      name = var.app3_labels.name
      tier = var.app3_labels.tier
    }
  }
  spec {
    selector {
      match_labels = {
        name = var.app3_labels.name
        tier = var.app3_labels.tier
      }
    }
    template {
      metadata {
        name = var.app3_name
        labels = {
          name = var.app3_labels.name
          tier = var.app3_labels.tier
        }
      }
      spec {
        container {
          name  = var.app3_name
          image = "mongo:4.4.12"
        }
      }
    }
  }
}
