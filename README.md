## Task description:

You should develop a Terraform code in `main.tf` that implements predefined variables used to deploy infrastructure on GCP.

Your task is to review the variables and their descriptions, and deploy designed infrastructure using additional needed resources.

The variables defined in the code (`variables.tf`) are as follows:

| **Variable**  | **Description** |
| --- | --- |
| `project` | Name of your GCP project  |
| `region` | The GCP region where the infrastructure will be deployed. The default value is `europe-central-1`  |
| `zone`  | The availability zone where the infrastructure will be deployed. The default value is `europe-central-1a`  |
| `network_name`  | The name of the custom VPC. The default value is `development` |
| `subnet_name`  | The name of the subnetwork. The default value is `development` |
| `subnet_cidr`  | The CIDR block for the custom subnet. The default value is `10.0.0.0/16` |
| `environment`  | The environment label where the infrastructure will be deployed. The default value is `dev`  |
| `instance_type`  | The instance type to be used for the Compute Engine instance. The default value is `e2-micro`  |
| `instance_name`  | The name to be used for the Compute Engine instance. The default value is `webserver`  |
| `image_family`  | The family of the VM image for the instance to be launched. The default value is `ubuntu-2204-lts`  |
| `image_project`  | The project of the VM image for the instance to be launched. The default value is `ubuntu-os-cloud`  |
| `network_tags`  | A list of network tags to be applied to the instance. The default value is `["web"]`  |
| `allowed_ports`  | A list of allowed ports. The default value is `["80", "443", "22", "8080"]`  |

> Note: You will need to provide a startup script to install an Apache2 web server.

Also you should develop respective `ouputs.tf` with following information about created resources: 


```terraform
output "instance_public_ip" {put your code here}

output "instance_image_id" {put your code here}

output "instance_type" {put your code here}

output "instance_network" {put your code here}

output "instance_subnet" {put your code here}

output "instance_zone" {put your code here}
```

> Note: The outputs must use `google_compute_instance` resouce attributes not the variables.

After your code will be developed you need to make several steps to complete this task: 


1. Install Terraform (or it could be already installed)

2. Run terraform init, plan and finally apply in your directory with your terrafom files.

3. Be sure, that you have properly configured GCP credentials, beacause it is required.

4. After successfully completing you should run terraform output and save its result as a file `result`. 

## Short overview

This Terraform code defines infrastructure resources for a VPC and Compute Engine instance with a public subnet and a firewall for the instance.

The provider for the code is GCP, and it takes the region information from a variable defined in a `variables.tf` file.

The code defines a VPC resource using the `google_compute_network` block and sets its name. 

It also defines a subnet using the `google_compute_subnetwork` block, which has a CIDR block, VPC ID, a region and a name that are set from variables.

Finally, an Compute Engine instance resource is created with an image found through a data source using image family and image project from variables, instance type, network, and and other variables.

A startup script to install and start an Apache2 server must be provided. 

A security group is defined for the instance with dynamic ingress rules for specified ports and a default egress rule allowing all traffic.

Overall, this Terraform code provisions a VPC with a subnet and a Compute Engine instance with a firewall that allows incoming traffic on specified ports.
