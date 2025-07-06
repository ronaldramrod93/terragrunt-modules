include "root" {
  path = find_in_parent_folders()
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

inputs = {

  google_service_account_account_id = "terraform-automation"
  google_service_account_display_name = "Terraform service account"

  # IMPORTANT! For google_project_iam_binding, google_project_iam_member
  # if members / member value is not set (null or empty) 
  # then it will be used the email value of google_service_account_account_id variable 
  google_project_iam_member = [
    {
	    role = "roles/storage.admin"
    },
    {
    	role = "roles/container.clusterAdmin"
    },
    {
    	role = "roles/compute.networkAdmin"
    },
    {
    	role = "roles/iam.serviceAccountAdmin"
    },
    {
    	role = "roles/iam.serviceAccountUser"
    },
    {
    	role = "roles/resourcemanager.projectIamAdmin"
    }
  ]

  google_service_account_iam_member = [
    {
      role = "roles/iam.serviceAccountTokenCreator"
      member = "user:${local.common_vars.locals.local_user_email}"
    }
  ]
}