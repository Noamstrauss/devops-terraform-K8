1.reduce variable count
- I thought of creating another variables file that has less variables to manage.
- Or Creating a template and changing it between deployments
## I have created one variable named "apps_config" to configure the 3 tier app ##

2. remove duplicate code
- To iterate over a list when provisioning resources  ( https://learn.hashicorp.com/tutorials/terraform/for-each )


3.change network acl
- To change the port in egress in the acl_backend to the new port developers have exposed
## Changed acl_backend egress port 81 ##

4.implement resource management
- to add cpu/memory limit to the container brackets
- or use a LimitRange object
## I added cpu/memory limit to the container brackets ##

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
