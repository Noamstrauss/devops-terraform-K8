##Devops Assignment Q&A
by Noam Strauss


1.reduce variable count

- I thought of creating another variables file that has fewer variables to manage.
- Or Creating a template and changing it between deployments.
#### Answer 1: I have created one variable named "apps_config" to configure the 3 tier app ####

2. remove duplicate code
- To Create a template and iterate over a list when provisioning resources  
 ( https://learn.hashicorp.com/tutorials/terraform/for-each )
- Debating if to create a one statement also for network.tf 

3.change network acl
- To change the port in egress in the acl_backend to the new port developers have exposed
- To change the "frontend" to "backend" {frontend-ingress-ports & protocol } in the network.tf ? 
#### Answer: Changed acl_backend egress port 81 ####

4.implement resource management
- to add cpu/memory limit to the container brackets
- or use a LimitRange object
#### Answer: I added cpu/memory limit to the container brackets ####

5.make scaling possible
- K8 Autoscaling

6. prepare for multi-environment
- terraform workspaces?

7. add environment variable to service
- use secrets (google)
- key volt?
- file?
(https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret)

------------------------------------
Questions:
- why terraform? (helm?)
- where is the service?
