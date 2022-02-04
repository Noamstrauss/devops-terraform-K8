resource "kubernetes_network_policy_v1" "instance" {
for_each = var.apps_config3
  metadata {
    name      = format("%s-acl", each.value.name)
    namespace = each.value.name
  }
  spec {
    policy_types = ["Ingress", "Egress"]
    pod_selector {
      match_labels = {
        tier = each.value.labels.tier
      }
    }
    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = each.value.acl.ingress
          }
        }
      }


      ports {
        port     = each.value.acl.port
        protocol = each.value.acl.protocol
      }
      ports {
        port     = each.value.acl.targetport
        protocol = each.value.acl.protocol
        // Added targetport (80 & 27017) for the receive packet to be able to come back
      }

    }
    egress {
      to {
        ip_block {
          cidr = each.value.acl.egress
        }
      }
    }
  }
}
