

##Devops Assignment Q&A
by Noam Strauss


----
1.reduce variable count

- I thought of creating one variable file that has fewer variables to manage.
<p style='color:green'>Answer 1: I have created one variable named "apps_config3" to configure the 3 tier app values.</p>


----
2. remove duplicate code
- To iterate over a list when provisioning resources  
 ( https://learn.hashicorp.com/tutorials/terraform/for-each )
<p style='color:green'>Answer 2: I used for-each loop to provision the 3 apps.</p>


----
3.change network acl
- to change the port in the ingress in frontend -> acl -> port variable in variables.tf to the new port (81)
- To change the "frontend" to "backend" {frontend->acl->ingress->} in the variables.tf ?

<p style='color:green'>Answer 3 : 
 A. lets assume Developers Changed backend port to 81 , So we need to change the frontend -> acl -> port to (81)<br>
 B. Created A Service for apps & Database.</p>

 


----
4.implement resource management
- To add cpu/memory limit to the container brackets
- To use a LimitRange object

- <p style='color:green'>Answer 4 : Added cpu/memory limit to the container brackets in deployments.tf.</p>


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
