##Devops Assignment Q&A
by Noam Strauss


----
1.reduce variable count

- I thought of creating one variable file that has fewer variables to manage.
#### Answer 1: I have created one variable named "apps_config3" to configure the 3 tier app values ####

----
2. remove duplicate code
- To iterate over a list when provisioning resources  
 ( https://learn.hashicorp.com/tutorials/terraform/for-each )
#### Answer 2: I used for-each loop to provision the 3 apps ####


----
3.change network acl
- To change the port in egress in the acl_backend to the new port developers have exposed
- To change the "frontend" to "backend" {frontend-ingress-ports & protocol} in the network.tf ?
#### Answer: Changed acl_backend egress port 81 ####


----
4.implement resource management
- to add cpu/memory limit to the container brackets
- to use a LimitRange object
#### Answer: I added cpu/memory limit to the container brackets in deployments.tf ####

----
5.make scaling possible
- configure (HPA) Autoscaling 
- Configure Service?
- #### Answer 5: You can also use `kubectl autoscale --namespace="<namespacehere>" deployment <deploymenthere> --cpu-percent=50 --min=2 --max=4`

----
6. prepare for multi-environment
- terraform workspaces?
- to add an input variable that's k8s namespaces accordingly
- to use 3 tfvars files to initialize the env variables

----
7. add environment variable to service
- use secrets (google)
- key volt?
- file?
(https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret)
- 
------------------------------------
Questions:
- why terraform? (helm maybe?)
- where is the service?
