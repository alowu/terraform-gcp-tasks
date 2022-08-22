project          = "$id_of_your_project"
credentials_file = "/$path_to_your_key/$name_of_your_key.json"
region           = "europe-central2"
zone             = "europe-central2-a"
#app.vars -- follow the regexp syntax: no capital letters etc.
app_name             = "my-app" #App name of your choosing
app_environment      = "dev"    #dev, test, stage, prod
app_domain           = "my-app.com" #domain name of your choosing
app_project          = "my-app.project" #project name of your choosing
public_subnet_cidr_1 = "10.10.1.0/24"

#Change project id for the one GCP assigned for it (mind that project id is not the same as its name);

#Change credentials_file path to actual relative or absolute path to the access key of your project you copied earlier. For example, you can store it in "key" directory of your terraform config, in such case credentials file path would be something along the lines of "./key/tf-project-key.json". Note that in given example main.tf reads the file content with "file(var.key)" syntax.