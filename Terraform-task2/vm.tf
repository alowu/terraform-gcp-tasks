# Terraform plugin for creating random ids, so that they are always unique.
resource "random_id" "instance_id" {
  byte_length = 4
}
# Create VM with generated random unique id.
resource "google_compute_instance" "vm_instance_public" {
  name         = "${var.app_name}-vm-${random_id.instance_id.hex}"
  machine_type = "f1-micro"
  zone         = var.zone
  hostname     = "${var.app_name}-vm-${random_id.instance_id.hex}.${var.app_domain}"
  tags         = ["ssh", "http", "https", "rdp"]
   #attaching the firewall rules for this VM to receive certain traffic, regulated in firewall.tf config file.

  boot_disk {
    initialize_params {
      image = "debian-10-buster-v20220719"
    }
  }

  metadata_startup_script = "apt update -y && apt install -y build-essential apache2"
   #Installing Apache Web-server on this VM after it boots up

  network_interface {
    network    = google_compute_network.vpc.name
    subnetwork = google_compute_subnetwork.public_subnet_1.name
    access_config {}
  }
}