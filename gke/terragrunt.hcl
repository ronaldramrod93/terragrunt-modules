terraform {
    source = "git::https://github.com/ronaldramrod93/pf_tf-modules.git//modules/gke?ref=main"

}

remote_state {
  
  backend = "gcs"

  config = {
    bucket  = "pf-tfstate"
    prefix = "gke/${path_relative_to_include()}"
  }
}

inputs = {
  project_id = "model-craft-397223"
  region     = "us-central1"
}