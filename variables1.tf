variable "apps_config" {
  description = "details about the frontend and backend apps"
  type = map(object({

    name = object({
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

  }))

  apps_config = {
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
  }
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
  }
    database= {
          name = {
                  name    = "stream-backend"
                  image   = "stream-database"
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
  }

  }
}






