###Devops Assignment Q&A
by Noam Strauss


----
1.reduce variable count

- Creating one variable file that has fewer variables to manage.
<p style='color:purple'>Answer: I have created one variable named "apps_config3" to configure the 3 tier app values.</p>


----
2. remove duplicate code
- To iterate over a list when provisioning resources
 ( https://learn.hashicorp.com/tutorials/terraform/for-each )
<p style='color:purple'>Answer: I used for-each loop to provision the 3 apps.</p>


----
3.change network acl
- To change the port in the ingress in frontend -> acl -> port in variables.tf to the new port (81)
- To Create A Service for each app
- In minikube I had to use "calico" plugin for network policy to work
<p style='color:purple'>Answer: 
 (A). lets assume Developers Changed backend port to 81 , So we need to change 
the frontend -> acl -> port in variables.tf to 81.<br>
 - 
(B). Created A Service for apps & Database.</p>

 


----
4.implement resource management
- Add cpu/memory limit to the container brackets
- Alternative: To use a LimitRange object
- You should also enable metric server using `minikube addons enable metrics-server`

 <p style='color:purple'>Answer: Added cpu/memory limit to the container brackets in deployments.tf.</p>


----
5.make scaling possible
- We need to Provision metric server then (See Notes)
- Configure HorizontalPodAutoscaler (HPA) 
- You can alternatively use the command bellow >
`kubectl autoscale --namespace="<namespacehere>" deployment <deploymenthere> --cpu-percent=50 --min=2 --max=4`
 <p style='color:purple'>Answer: I Used The Command Above To Provision HPA</p>

----
6. prepare for multi-environment
- Use terraform workspaces
 usage >> `terraform apply -auto-approve -var-file=environments/test/test.tfvars`
 <p style='color:purple'>Answer: Use Terraform workspace with .tfvar files to provision different ENVs (Usage in terraform apply ^)</p>


----
7. add environment variable to service
- use secrets (google)
- key volt?
- file?
(https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret)
- 
------------------------------------
Notes:
 ![img.png](img.png)
- ( Because I Had a bit of trouble getting metric server to work I used the Command >> )
-------------------------------------
Questions:
- where is the service resource?
