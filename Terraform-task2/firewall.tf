# allow http traffic trough the firewall
resource "google_compute_firewall" "allow-http" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-http"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  source_ranges = ["0.0.0.0/0"]
   #specify the range of IP addresses that would be subject to firewall rules: 0.0.0.0 range includes every address. Feel free to play around with certain ranges and values. Check below for details.
  target_tags   = ["http"]
   #specify the VMs you want to receive this traffic on (check vm.tf).

}
# allow https traffic trough the firewall
resource "google_compute_firewall" "allow-https" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-https"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["https"]
}
# allow ssh traffic trough the firewall
resource "google_compute_firewall" "allow-ssh" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-ssh"
  network = google_compute_network.vpc.name
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["ssh"]
}
# allow rdp traffic trough the firewall
resource "google_compute_firewall" "allow-rdp" {
  name    = "${var.app_name}-${var.app_environment}-fw-allow-rdp"
  network = google_compute_network.vpc.name
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["rdp"]
}

#source_ranges - If source ranges are specified, the firewall will apply only to traffic that has source IP address in these ranges. These ranges must be expressed in CIDR format. One or both of sourceRanges and sourceTags may be set. If both properties are set, the firewall will apply to traffic that has source IP address within sourceRanges OR the source IP that belongs to a tag listed in the sourceTags property. The connection does not need to match both properties for the firewall to apply.

#target_tags - A list of instance tags indicating sets of instances located in the network that may make network connections as specified in allowed[]. If no targetTags are specified, the firewall rule applies to all instances on the specified network.