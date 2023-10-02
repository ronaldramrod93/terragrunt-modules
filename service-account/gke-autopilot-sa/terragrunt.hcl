include "root" {
  path = find_in_parent_folders()
}

inputs = {

  google_service_account_account_id = "gke-autopilot"
  google_service_account_display_name = "GKE autopilot service account"

  # IMPORTANT! If members value is not set (null or empty) so it will set the service account email of google_service_account_account_id
  google_project_iam_binding = [
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

  google_service_account_iam_binding = [
    {
      role = "roles/iam.serviceAccountTokenCreator"
      members = [ "user:ronald.ramrod.93@gmail.com" ]
    }
  ]
}