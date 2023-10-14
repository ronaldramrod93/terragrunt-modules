include "root" {
  path = find_in_parent_folders()
}

inputs = {

  google_compute_network_name = "us-ce1-dev-gke-1"
  google_compute_network_description = "Network created by GKE cluster"

  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#custom-subnet-mode
  google_compute_network_auto_create_subnetworks = false

  google_compute_network_routing_mode = "REGIONAL"

}