variable "apps_config3" {
  description = "Configuration for apps & database"
  type        = map(object({
       name            = string
       image           = string
       imagePullPolicy = string

     acl = object({
       targetport      = string
       ingress         = string
       egress          = string
       port            = string
       protocol        = string
       targetport      = string
    })

    annotations = object({
       serviceClass    = string
       loadBalancer    = string
    })
    labels = object({
       name            = string
       tier            = string
       owner           = string
      env              = string
    })
    limit = object({
       max_cpu         = string
       max_memory      = string
       req_cpu         = string
       req_memory      = string
    })

  }))

  default = {
    frontend = {
       name            = "stream-frontend-prod"
       image           = "nginx"
       imagePullPolicy = "IfNotPresent"



      annotations = {
       serviceClass    = "web-frontend"
       loadBalancer    = "external"
      }

      acl = {
        ingress        = "stream-backend"
       egress          = "0.0.0.0/0"
       port            = "81"
        targetport     = "80"
       protocol        = "TCP"



      }
      labels = {
        name           = "stream-frontend"
        tier           = "web"
        owner          = "product"
        env            = "prod"
       }

       limit = {
        max_cpu        = "0.6"
        max_memory     = "512Mi"
        req_cpu        = "0.4"
        req_memory     = "150Mi"
       }

    },
    backend  = {
      name             = "stream-backend"
       image           = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass    = "web-backend"
       loadBalancer    = "internal"
      }

       acl = {
        ingress        = "stream-frontend"
       egress          = "172.17.0.0/24"
       port            = "81"
       targetport      = "80"
       protocol        = "TCP"

      }
      labels = {
        name           = "stream-backend"
        tier           = "api"
        owner          = "product"
        env            = "dev"
       }
       limit = {
        max_cpu        = "0.6"
        max_memory     = "512Mi"
        req_cpu        = "0.4"
        req_memory     = "150Mi"
       }
    },
    database  = {
       name            = "stream-database"
       image           = "mongo:4.4.12"
       imagePullPolicy = "IfNotPresent"


      annotations = {
       serviceClass    = "database"
       loadBalancer    = "disabled"
      }

       acl = {
        ingress        = "stream-backend"
       egress          = "172.17.0.0/24"
       port            = "27017"
         targetport    = "27017"
       protocol        = "TCP"

      }
       labels = {
        name           = "stream-database"
        tier           = "shared"
        owner          = "product"
         env           = "dev"
       }
       limit = {
        max_cpu        = "0.6"
        max_memory     = "512Mi"
        req_cpu        = "0.4"
        req_memory     = "150Mi"
       }
  }
}

}



