apps_config3 = {
    frontend = {
       name         = "stream-frontend-test"
       image        = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass = "web-frontend-test"
       loadBalancer = "external"
      }

      acl = {
       ingress       = "stream-backend-test"
       egress        = "0.0.0.0/0"
       port          = "81"
       targetport    = "80"
       protocol      = "TCP"

      }
      labels = {
        tier         = "web"
        owner        = "product"
        env          = "test"
       }

       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }


    },
    backend  = {
       name            = "stream-backend-test"
       image           = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass    = "web-backend-test"
       loadBalancer    = "internal"
      }

       acl = {
       ingress       = "stream-frontend-test"
       egress        = "10.96.0.0/8"
       port          = "81"
       targetport    = "80"
       protocol      = "TCP"

      }
      labels = {
        tier         = "api"
        owner        = "product"
        env          = "test"
       }

       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }


    },
    database  = {
       name            = "stream-database-test"
       image           = "mongo:4.4.12"
       imagePullPolicy = "IfNotPresent"


      annotations = {
       serviceClass = "database"
       loadBalancer = "disabled"
      }

       acl = {
       ingress      = "stream-backend-test"
       egress       = "10.96.0.0/8"
       port         = "27017"
       targetport   = "27017"
       protocol     = "TCP"

      }
       labels = {
        tier         = "shared"
        owner        = "product"
        env          = "test"
       }

       limit = {
        max_cpu      = "0.6"
        max_memory   = "512Mi"
        req_cpu      = "0.4"
        req_memory   = "150Mi"
       }
  }
}
