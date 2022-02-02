variable "apps_config2" {
  description = "details about the apps & database"
  type        = map(object({
    name         = string
    tier         = string
    image        = string
    imagePullPolicy = string
    owner        = string
    serviceClass = string
    loadBalancer = string
    ingress      = string
    egress       = string
    port         = string
    protocol     = string
    max_cpu      = string
    max_memory   = string
    req_cpu      = string
    req_memory   = string
  }))

  default = {
    frontend = {
       name         = "stream-frontend-test"
       image        = "nginx"
       imagePullPolicy = "IfNotPresent"
       tier         = "web"
       owner        = "product"
       serviceClass = "web-frontend-test"
       loadBalancer = "external"
       ingress      = "stream-backend-test"
       egress       = "0.0.0.0/0"
       port         = "80"
       protocol     = "TCP"
       max_cpu      = "0.6"
       max_memory   = "512Mi"
       req_cpu      = "0.4"
       req_memory   = "150Mi"
    },
    backend  = {
      name          = "stream-backend-test"
       image        = "nginx"
       imagePullPolicy = "IfNotPresent"
       tier         = "api"
       owner        = "product"
       serviceClass = "web-backend-test"
       loadBalancer = "internal"
       ingress      = "stream-frontend-test"
       egress       = "172.17.0.0/24"
       port         = "81"
       protocol     = "TCP"
       max_cpu      = "0.6"
       max_memory   = "512Mi"
       req_cpu      = "0.4"
       req_memory   = "150Mi"
    },
    database  = {
       name         = "stream-database-test"
       image        = "mongo:4.4.12"
       imagePullPolicy = "IfNotPresent"
       tier         = "shared"
       owner        = "product"
       serviceClass = "database"
       loadBalancer = "disabled"
       ingress      = "stream-backend-test"
       egress       = "172.17.0.0/24"
       port         = "27017"
       protocol     = "TCP"
       max_cpu      = "0.7"
       max_memory   = "750Mi"
       req_cpu      = "0.4"
       req_memory   = "150Mi"
  }
}

}



