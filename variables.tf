variable "apps_config3" {
  description = "Configuration for apps & database"
  type        = map(object({
    name         = string
    image        = string
    imagePullPolicy = string

     acl = object({
       portname    = string
       ingress     = string
      egress       = string
      port         = string
      protocol     = string
    })

    annotations = object({
      serviceClass = string
      loadBalancer = string
    })
    labels = object({
      name         = string
      tier         = string
      owner        = string
    })
    limit = object({
      max_cpu = string
      max_memory   = string
      req_cpu = string
      req_memory = string
    })
  }))

  default = {
    frontend = {
       name         = "stream-frontend-test"
       image        = "nginx"
       imagePullPolicy = "IfNotPresent"



      annotations = {
       serviceClass = "web-frontend"
       loadBalancer = "external"
      }

      acl = {
        ingress      = "stream-backend"
       egress       = "0.0.0.0/0"
       port         = "80"
        portname    = "http"
       protocol     = "TCP"


      }
      labels = {
        name         = "stream-frontend"
        tier         = "web"
        owner        = "product"
       }
       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }
    },
    backend  = {
      name          = "stream-backend-test"
       image        = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass = "web-frontend"
       loadBalancer = "external"
      }

       acl = {
        ingress      = "stream-backend"
       egress       = "0.0.0.0/0"
       port         = "80"
         portname    = "http"
       protocol     = "TCP"

      }
      labels = {
        name         = "stream-backend"
        tier         = "api"
        owner        = "product"
       }
       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }
    },
    database  = {
       name         = "stream-database"
       image        = "mongo:4.4.12"
       imagePullPolicy = "IfNotPresent"


      annotations = {
       serviceClass = "database"
       loadBalancer = "disabled"
      }

       acl = {
        ingress      = "stream-backend"
       egress       = "0.0.0.0/0"
       port         = "80"
         portname    = "mongodb"
       protocol     = "TCP"

      }
       labels = {
        name         = "stream-database"
        tier         = "shared"
        owner        = "product"
       }
       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }
  }
}

}



