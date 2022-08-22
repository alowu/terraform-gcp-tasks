resource "google_compute_network" "vpc" {
 #creating a VPC network
  name         = "${var.app_name}-${var.app_environment}-vpc"
  routing_mode = "GLOBAL"
   #network's cloud routers will advertise routes with all subnetworks of this network, across all regions, in this example might be set to REGIONAL.
}
# create public subnet
resource "google_compute_subnetwork" "public_subnet_1" {
  name          = "${var.app_name}-${var.app_environment}-public-subnet-1"
  ip_cidr_range = var.public_subnet_cidr_1
  network       = google_compute_network.vpc.name
  region        = var.region
}
