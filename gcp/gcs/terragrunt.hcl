terraform {
  source = "git::https://github.com/ronaldramrod93/terraform-modules.git//gcp/gcs?ref=main"
}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

# Comment this block ONLY in the first run to create the tfstate bucket
remote_state {
  
  backend = "gcs"

  config = {
    bucket = "${local.common_vars.locals.remote_state_config_bucket}"
    prefix = "gcs/${path_relative_to_include()}"
  }
}

inputs = {
  project_id = "${local.common_vars.locals.project_id}"
  region     = "us-central1"
}