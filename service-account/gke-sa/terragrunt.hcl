include "root" {
  path = find_in_parent_folders()
}

inputs = {

  google_service_account_account_id = "gke-sa"
  google_service_account_display_name = "GKE service account"

  # IMPORTANT! For google_project_iam_binding, google_project_iam_member
  # if members / member value is not set (null or empty) 
  # then it will set the service account email of google_service_account_account_id variable  

  google_project_iam_member = [
    {
      role = "roles/monitoring.viewer"
    },
    {
      role = "roles/monitoring.metricWriter"
    },
    {
      role = "roles/logging.logWriter"
    },
    {
      role = "roles/stackdriver.resourceMetadata.writer"
    },
    {
      role = "roles/autoscaling.metricsWriter"
    }
  ]

  google_service_account_iam_member = [
    {
      role = "roles/iam.serviceAccountTokenCreator"
      member = "user:ronald.ramrod.93@gmail.com"
    }
  ]
}