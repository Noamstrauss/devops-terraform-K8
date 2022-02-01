variable "apps_config" {
  description = "details about the apps & database"
  type = map(object({

    name = object
    ({
      name = string
      image = string
    })

    label = object
    ({
      name = string
      tier = string
      owner = string
    })

    annotation = object
    ({
      serviceClass = string
      loadBalancer = string
    })

    acl = object
    ({
      ingress  = string
      egress   = string
      port     = string
      protocol = string
    })

    limits = object
    ({
      cpu    = string
      memory = string
    })

    limit_request = object
    ({
      cpu    = string
      memory = string
    })

  }))

  default = {
    app_subnet = {
      name                 = "app_subnet"
      resource_group_name  = "vCloud-lab.com"
      virtual_network_name = "example_vnet"
      address_prefixes     = ["10.0.1.0/24"]
    },
    db_subnet = {
      name                 = "db_subnet"
      resource_group_name  = "vCloud-lab.com"
      virtual_network_name = "example_vnet"
      address_prefixes     = ["10.0.2.0/24"]
    }
  }




 /* default = {
    frontend= {
          name = {
            name    = "stream-frontend"
            image   = "nginx"
                  }

          Label = {
            name = "stream-frontend"
            tier  = "web"
            owner = "product"
                  }

          annotation = {
            serviceClass = "web-frontend"
            loadBalancer = "external"
                 }

          acl = {
            ingress  = "stream-backend"
            egress   = "0.0.0.0/0"
            port     = "80"
            protocol = "TCP"
          }

          limits = {
             cpu    = "0.6"
             memory = "512Mi"
          }

          limit_request = {
              cpu    = "300m"
              memory = "50Mi"
          }
  },
    backend= {
          name = {
            name    = "stream-backend"
            image   = "nginx"
                  }

          Label = {
            name = "stream-backend"
            tier  = "api"
            owner = "product"
                  }

          annotation = {
            serviceClass = "web-frontend"
            loadBalancer = "external"
                 }

          acl = {
            ingress  = "stream-frontend"
            egress   = "172.17.0.0/24"
            port     = "80"
            protocol = "TCP"
              }

          limits = {
             cpu    = "0.5"
             memory = "512Mi"
          }

          limit_request = {
              cpu    = "300m"
              memory = "50Mi"
          }
  },
    database= {
          name = {
            name    = "stream-backend"
            image   = "mongo:4.4.12"
                  }

          Label = {
            name = "stream-database"
            tier  = "shared"
            owner = "product"
                  }

          annotation = {
            serviceClass = "database"
            loadBalancer = "disabled"
                 }

         acl = {
            ingress  = "stream-backend"
            egress   = "172.17.0.0/24"
            port     = "27017"
            protocol = "TCP"
                }

          limits = {
             cpu    = "0.7"
             memory = "512Mi"
          }

          limit_request = {
              cpu    = "300m"
              memory = "50Mi"
          }
     }

  }*/
}






