include "root" {
  path = find_in_parent_folders()
}

inputs = {
  bucket_name = "portfolio-tfstate-25102025"
  
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