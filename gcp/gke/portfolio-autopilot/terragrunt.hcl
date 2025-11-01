include "root" {
  path = find_in_parent_folders()
}

inputs = {

  google_container_cluster_enable_autopilot = true
 
  google_container_cluster_name = "portfolio-autopilot"
  google_service_account_account_id = "gke-autopilot"

  # Best-practice: Use custom subnet mode
  # https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#custom-subnet-mode
  google_container_cluster_subnetwork = "cp-it-us-dev-vpc-1-gke-subnet-1"

  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#private-cluster-type
  # Private Google Access is enabled by default in clusters with private nodes,
  google_container_cluster_private_cluster_config_enable_private_nodes = true

  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#minimize-control-plane-exposure
  # Use only the DNS-based endpoint to access your control plane for simplified configuration and a flexible and policy-based layer of security.
  google_container_cluster_control_plane_endpoints_config_dns_endpoint_config_allow_external_traffic = true
  google_container_cluster_control_plane_endpoints_config_ip_endpoints_config_enabled = false
  google_container_cluster_private_cluster_config_enable_private_endpoint = true
  
  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#plan-ip-allotment
  # For private clusters, you must define a node subnet, a Pod IP address range, and a Service IP address range.
  google_container_cluster_ip_allocation_policy_cluster_secondary_range_name = "gke-pods-1"
  google_container_cluster_ip_allocation_policy_services_secondary_range_name = "gke-services-1" 

  # For Autopilot clusters, VPC-native mode is always on and cannot be turned off.
  # Best-practice: Use VPC-native cluster for using alias IP address range. 
  # Refer to https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#vpc-native-clusters for more details. 
  #google_container_cluster_networking_mode = "VPC_NATIVE"

  # For Autopilot clusters, the maximum number of Pods per node is set to 32, reserving a /26 range for every node. This setting is non-configurable in Autopilot clusters.
  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#pod-density-per-node
  #google_container_cluster_default_max_pods_per_node = 16

  # Best-practice: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#restrict-traffic-network-pols
  # GKE network policies are configured through the Kubernetes Network Policy API to enforce a cluster's Pod communication.
  #google_container_cluster_network_policy_enabled = true

  # GKE Autopilot clusters, use Dataplane V2 by default in versions 1.22.7-gke.1500 and later and versions 1.23.4-gke.1500 and later.
  # Best-practice:  https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#dataplane-v2
  # GKE Dataplane V2 provides an integrated network security and visibility experience.
  #google_container_cluster_datapath_provider = "ADVANCED_DATAPATH"


  google_container_cluster_deletion_protection = false # enable by testing
  #google_container_cluster_deletion_protection = true

  #TO DO: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#restrict-traffic-network-pols
  #TO DO: https://cloud.google.com/kubernetes-engine/docs/best-practices/networking#logging-monitoring
  #TO DO: Add more restriction in DNS endpoint access in GKE cluster
}