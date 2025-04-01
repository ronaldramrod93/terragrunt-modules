terraform {
    source = "git::https://github.com/ronaldramrod93/terraform-modules.git//gcp/service-account?ref=main"

}

remote_state {
  
  backend = "gcs"

  config = {
    bucket = "tfstate-ronram-portfolio"
    prefix = "service-account/${path_relative_to_include()}"
  }
}

inputs = {
  project_id = "marine-defender-450403-f6"
  region     = "us-central1"
}