include "root" {
  path = find_in_parent_folders()
}

inputs = {
 
  google_container_cluster_name = "portfolio"
  google_service_account_account_id = "gke-sa"

}