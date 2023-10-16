include "root" {
  path = find_in_parent_folders()
}

inputs = {

  # Prerequisite: The compute network must already be created
  google_compute_network_name = "us-ce1-dev-gke-1"

  google_compute_subnetwork_name = "gke-nodes-1"
  google_compute_subnetwork_description = "Subnet used by nodes in GKE cluster"

  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#use-private-google-access
  google_compute_subnetwork_private_ip_google_access = true

  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#plan-ip-allotment
  # For private clusters, you must define a node subnet, a Pod IP address range, and a Service IP address range.
  
  google_compute_subnetwork_ip_cidr_range = "10.1.0.0/28"

  # The Pod and Service IP address range always will be defined as secondary IP ranges
  google_compute_subnetwork_secondary_ip_range = [
    {
      range_name = "gke-pods-1"
      ip_cidr_range = "10.2.0.0/24"
    },
    {
      range_name = "gke-services-1"
      ip_cidr_range = "10.2.2.0/27"
    }
  ]

}