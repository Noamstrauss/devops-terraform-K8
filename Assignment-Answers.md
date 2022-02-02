##Devops Assignment Q&A
by Noam Strauss


----
1.reduce variable count

- I thought of creating another variables file that has fewer variables to manage.
#### Answer 1: I have created one variable named "apps_config" to configure the 3 tier app values ####

----
2. remove duplicate code
- To Create a template and iterate over a list when provisioning resources  
 ( https://learn.hashicorp.com/tutorials/terraform/for-each )
#### Answer 2: I have a loop using for-each to provision the 3 apps ####


----
3.change network acl
- To change the port in egress in the acl_backend to the new port developers have exposed
- To change the "frontend" to "backend" {frontend-ingress-ports & protocol} in the network.tf ? 
#### Answer: Changed acl_backend egress port 81 ####


----
4.implement resource management
- to add cpu/memory limit to the container brackets
- or use a LimitRange object
#### Answer: I added cpu/memory limit to the container brackets ####

----
5.make scaling possible
- configure (HPA) Autoscaling 
- You can also use `kubectl autoscale --namespace="<namespacehere>" deployment <deploymenthere> --cpu-percent=50
 --min=2 --max=4`

----
6. prepare for multi-environment
- terraform workspaces?

----
7. add environment variable to service
- use secrets (google)
- key volt?
- file?
(https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret)

------------------------------------
Questions:
- why terraform? (helm?)
- where is the service?
