include "root" {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "tfstate-store-072025"
  
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