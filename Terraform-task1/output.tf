output "ip" {
  value = google_compute_instance.vm_instance.network_interface.0.network_ip
}

#This "output.tf" config makes terraform show the assigned internal ip address of this virtual machine in VPC network in its logs after he's finished building the resources up. Feel free to experiment with different parameters and request other outputs to show.