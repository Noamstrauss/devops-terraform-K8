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
        ingress      = "stream-backend-test"
       egress        = "0.0.0.0/0"
       port          = "81"
        targetport   = "80"
       protocol      = "TCP"



      }
      labels = {
        name         = "stream-frontend-test"
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
      name             = "stream-backend-test"
       image           = "nginx"
       imagePullPolicy = "IfNotPresent"

      annotations = {
       serviceClass    = "web-backend-test"
       loadBalancer    = "internal"
      }

       acl = {
        ingress      = "stream-frontend-test"
       egress        = "172.17.0.0/24"
       port          = "81"
       targetport    = "80"
       protocol      = "TCP"

      }
      labels = {
        name         = "stream-backend-test"
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
       egress       = "172.17.0.0/24"
       port         = "27017"
         targetport = "27017"
       protocol     = "TCP"

      }
       labels = {
        name         = "stream-database-test"
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
