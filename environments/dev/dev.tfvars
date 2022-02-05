apps_config3 = {
    frontend = {
       name         = "stream-frontend-dev"
       image        = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass = "web-frontend-dev"
       loadBalancer = "external"
      }

      acl = {
        ingress      = "stream-backend-dev"
       egress        = "0.0.0.0/0"
       port          = "81"
        targetport   = "80"
       protocol      = "TCP"

      }
      labels = {
        name         = "stream-frontend-dev"
        tier         = "web"
        owner        = "product"
        env          = "dev"
       }
       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }


    },
    backend  = {
      name             = "stream-backend-dev"
       image           = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass    = "web-backend-dev"
       loadBalancer    = "internal"
      }

       acl = {
        ingress      = "stream-frontend-dev"
       egress        = "10.96.0.0/8"
       port          = "81"
       targetport    = "80"
       protocol      = "TCP"

      }
      labels = {
        name         = "stream-backend-dev"
        tier         = "api"
        owner        = "product"
        env          = "dev"
       }
       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }
    },
    database  = {
       name            = "stream-database-dev"
       image           = "mongo:4.4.12"
       imagePullPolicy = "IfNotPresent"


      annotations = {
       serviceClass = "database"
       loadBalancer = "disabled"
      }

       acl = {
        ingress      = "stream-backend-dev"
       egress       = "10.96.0.0/8"
       port         = "27017"
         targetport = "27017"
       protocol     = "TCP"

      }
       labels = {
        name         = "stream-database-dev"
        tier         = "shared"
        owner        = "product"
         env         = "dev"
       }
       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }
  }
}
