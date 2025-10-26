terraform {
    source = "git::https://github.com/ronaldramrod93/terraform-modules.git//gcp/subnetwork?ref=main"

}

locals {
  common_vars = read_terragrunt_config(find_in_parent_folders("common.hcl"))
}

remote_state {
  
  backend = "gcs"

  config = {
    bucket = "${local.common_vars.locals.remote_state_config_bucket}"
    prefix = "subnetwork/${path_relative_to_include()}"
  }
}

inputs = {
  project_id = "${local.common_vars.locals.project_id}"
  region     = "${local.common_vars.locals.region}"
}