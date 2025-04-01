terraform {
    source = "git::https://github.com/ronaldramrod93/terraform-modules.git//gcp/network?ref=main"

}

remote_state {
  
  backend = "gcs"

  config = {
    bucket  = "tfstate-ronram-portfolio"
    prefix = "network/${path_relative_to_include()}"
  }
}

inputs = {
  project_id = "marine-defender-450403-f6"
  region     = "us-central1"
}