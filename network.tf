
resource "kubernetes_network_policy" "network" {
for_each = {for inst in var.apps_config2:  inst.name => inst}
  metadata {
    name      = format("%s-acl", each.value["name"])
    namespace = each.value["name"]
  }
  spec {
    policy_types = ["Ingress", "Egress"]
    pod_selector {
      match_labels = {
        tier = each.value["tier"]
      }
    }
    ingress {
      from {
        namespace_selector {
          match_labels = {
            name = each.value["ingress"]
          }
        }
      }
      ports {
        port     = each.value["port"]
        protocol = each.value["protocol"]
      }
    }
    egress {
      to {
        ip_block {
          cidr = each.value["egress"]
        }
      }
    }
  }
}
