terraform {
    source = "git::https://github.com/ronaldramrod93/terraform-modules.git//gcp/network?ref=main"

}

# Call common variables from common.hcl file
locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

remote_state {
  
  backend = "gcs"

  config = {
    bucket = "${local.common_vars.locals.remote_state_config_bucket}"
    prefix = "network/${path_relative_to_include()}"
  }
  
}

inputs = {
  project_id = "${local.common_vars.locals.project_id}"
  region     = "${local.common_vars.locals.region}"
}