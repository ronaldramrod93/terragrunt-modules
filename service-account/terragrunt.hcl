terraform {
    source = "git::https://github.com/ronaldramrod93/pf_tf-modules.git//modules/service-account?ref=main"

}

remote_state {
  
  backend = "gcs"

  config = {
    bucket  = "pf-tfstate"
    prefix = "service-account/${path_relative_to_include()}"
  }
}

inputs = {
  project_id = "model-craft-397223"
  region     = "us-central1"
}