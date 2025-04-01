include "root" {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "tfstate-portfolio"
  location    = "us-central1"
  enable_versioning = true
  labels = {
      env = "dev"
      purpose = "portfolio"
      created_by = "terraform"
  }
}