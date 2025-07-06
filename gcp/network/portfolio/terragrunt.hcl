include "root" {
  path = find_in_parent_folders()
}

inputs = {

  # Best-practice: https://cloud.google.com/architecture/best-practices-vpc-design?hl=en#naming
  google_compute_network_name = "cp-it-dev-vpc-1"
  google_compute_network_description = "Network created by testing"

  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#custom-subnet-mode
  google_compute_network_auto_create_subnetworks = false

  google_compute_network_routing_mode = "REGIONAL"

}