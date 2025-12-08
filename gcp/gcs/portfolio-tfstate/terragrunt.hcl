include "root" {
  path = find_in_parent_folders()
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

inputs = {

  bucket_name = "${local.common_vars.locals.remote_state_config_bucket}"
  
  location    = "us-central1"
  
  # Best-practice: enable versioning for state buckets
  # This will help to recover from accidental deletions or overwrites
  enable_versioning = true
  
  labels = {
      env = "test"
      team = "cloud-playground"
      purpose = "portfolio"
      created_by = "terraform"
  }

}