project          = "$id_of_your_project"
credentials_file = "/$path_to_your_key/$name_of_your_key.json"
region           = "europe-central2"
zone             = "europe-central2-a"

#Change project id for the one GCP assigned for it (mind that project id is not the same as its name);

#Change credentials_file path to actual relative or absolute path to the access key of your project you copied earlier. For example, you can store it in "key" directory of your terraform config, in such case credentials file path would be something along the lines of "./key/tf-project-key.json". Note that in given example main.tf reads the file content with "file(var.key)" syntax.