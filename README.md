# Creating resources in GCP with help of terraform.
This repository contains assignments for practical consolidation of acquired knowledge about terraform. Here are some tips to help you do it.
## Getting started
Create a new project under the name containing your surname (to avoid mixing them up with projects of other interns and to be able to track the resource expedinture through time) via GCP console. Turn the billing for your project on (if the number of projects currently attached to billing of account is at its limit, check with your mentor). Make sure that you have the necessary Compute Engine permissions on your user account: "compute.instance.\*" and "compute.firewalls.\*". Enable the Compute Engine, Resource Manager and OS Login APIs. Create and download "service_account key" that would allow terraform access cloud resources from your local machine (grant the "compute.engine admin" role, for example, if you plan to work with VMs) -- you will refer to it in your variables.tf file through relative or absolute path.
## Big brother watching you
To track the resource consumption of your project, you can check the "billing report" tab in GCP console in your browser, or install and connect "gcloud" cli tool:
https://cloud.google.com/sdk/docs/install

and then with the help of following command see the current parameters of your project and their supposed limits:

```gcloud compute project-info describe```
## Clean up after yourself
Always make sure that after you completed your current task you destroy requisited cloud resources with "terraform destroy" command, otherwise they will stay active and drain the billing account over time. It might not be as noticeable with tiny VMs, but even a smallest GKE cluster would cost over $5 each day if you forget to shut it down.
## Oops, where's my permissions?
If you receive an error that your security key does not have specific privileges for certain operations that terraform tries to perform when you try to apply (or plan) a new config - add them manually to your security key via google console (follow the instructions from error's text).
## Happiness loves silence
Best practices dictate that you list your cloud access credentials key, project id, region, zone, and other parameters - that could be a part of environment and subject to changes - as variables and refer to them in terraform config files without hardcoding them in the main file.
## Seven times measure cut once
Before applying created (or updated) terraform configudation to make written config easily readable and check for possible issues it's prudent to format it into convenient form, validate it, and then put it through "dry run" with "plan", so the order of commands would be as follows: 
* ```terraform init```
* ```terraform fmt```
* ```terraform validate```
* ```terraform plan -out=$name```
* ```terraform apply "$name"```
## Travel!
Terraform currently isn't available from within Belarus, so you have to have VPN enabled to be able to access and use it.
