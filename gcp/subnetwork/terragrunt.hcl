terraform {
    source = "git::https://github.com/ronaldramrod93/terraform-modules.git//gcp/subnetwork?ref=main"

}

remote_state {
  
  backend = "gcs"

  config = {
    bucket  = "tfstate-ronram-portfolio"
    prefix = "subnetwork/${path_relative_to_include()}"
  }
}

inputs = {
  project_id = "marine-defender-450403-f6"
  region     = "us-central1"
}