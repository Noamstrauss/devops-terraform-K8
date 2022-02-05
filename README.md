###Devops Assignment Q&A
- by Noam Strauss


----
###1.reduce variable count

- Creating one variable file that has fewer variables to manage.
<p style='color:yellow'>Answer: I have created one variable named "apps_config3" to configure the 3 tier app values.</p>


----
###2. remove duplicate code
- To iterate over a list when provisioning resources
 ( https://learn.hashicorp.com/tutorials/terraform/for-each )
<p style='color:yellow'>Answer: I used for-each loop to provision the 3 apps.</p>


----
###3.change network acl
- To change the port in the ingress in frontend -> acl -> port in variables.tf to the new port (81)
- To Create A Service for each app
- Because i use minikube i had to use "calico" plugin for network policy to work
<p style='color:yellow'>Answer: 
 (A). lets assume Developers Changed backend port to 81 , So we need to change 
the frontend -> acl -> port in variables.tf to 81.<br>
 - 
(B). Created A Service for apps & Database.</p>

 


----
### 4.implement resource management
- Add cpu/memory limit to the container brackets
- Alternative: To use a LimitRange object
- You should also enable metric server using `minikube addons enable metrics-server`

 <p style='color:yellow'>Answer: I Added cpu/memory limit to the container brackets in deployments.tf.</p>


----
### 5.make scaling possible
- We need to Provision metric server  (See Notes)
- Configure HorizontalPodAutoscaler (HPA) 
- You can alternatively use the command bellow >
`kubectl autoscale --namespace="<namespacehere>" deployment <deploymenthere> --cpu-percent=70 --min=2 --max=4`
 <p style='color:yellow'>Answer: I Used The Command Above To Provision HPA</p>

----
### 6. prepare for multi-environment
- Use terraform workspaces
 usage >> `terraform apply -auto-approve -var-file=environments/test/test.tfvars`
 <p style='color:yellow'>Answer: Use Terraform workspaces with .tfvar files to provision different ENVs (Usage in terraform apply ^)</p>


----
### 7. add environment variable to service
- To Create a Secret Resource and attach to the container
(https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret)
- <p style='color:yellow'>Answer: To Create a Secret resource and attach to the during deployment to the container.</p>
![img_1.png](img_1.png)
------------------------------------


#### Notes:
- ( Metric Server does not work properly , see below >>.)
 ![img.png](img.png)

-------------------------------------
