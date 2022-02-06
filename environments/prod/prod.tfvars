apps_config3 = {
    frontend = {
       name         = "stream-frontend-prod"
       image        = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass = "web-frontend-prod"
       loadBalancer = "external"
      }

      acl = {
       ingress       = "stream-backend-prod"
       egress        = "0.0.0.0/0"
       port          = "81"
       targetport    = "80"
       protocol      = "TCP"

      }
      labels = {
        tier         = "web"
        owner        = "product"
        env          = "prod"
       }

       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }


    },
    backend  = {
       name            = "stream-backend-prod"
       image           = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass    = "web-backend-prod"
       loadBalancer    = "internal"
      }

       acl = {
       ingress       = "stream-frontend-prod"
       egress        = "10.96.0.0/8"
       port          = "81"
       targetport    = "80"
       protocol      = "TCP"

      }
      labels = {
        tier         = "api"
        owner        = "product"
        env          = "prod"
       }

       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }


    },
    database  = {
       name            = "stream-database-prod"
       image           = "mongo:4.4.12"
       imagePullPolicy = "IfNotPresent"


      annotations = {
       serviceClass = "database"
       loadBalancer = "disabled"
      }

       acl = {
       ingress      = "stream-backend-prod"
       egress       = "10.96.0.0/8"
       port         = "27017"
       targetport   = "27017"
       protocol     = "TCP"

      }
       labels = {
        tier         = "shared"
        owner        = "product"
        env          = "prod"
       }

       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }
  }
}
