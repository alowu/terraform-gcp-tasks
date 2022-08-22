provider "google" {
  credentials = file(var.credentials_file)
  project     = var.project
  region      = var.region
  zone        = var.zone
}
 #Provider block refers to specific cloud provider and credentials, required to authorize with it, and specifies region and zone where resources will be allocated for you.
resource "google_compute_network" "vpc_network" {
  name = "default"
   #This block creates a VPC network.
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance"
  machine_type = "f1-micro"
   #This block specifies "f1-micro" machine type for VM (smallest possible resource-wise).
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
       #specifies the OS image for VM.
    }
  }
  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
     #attaches created VM to VPC network interface.
  }
}