include "root" {
  path = find_in_parent_folders()
}

inputs = {

  api_services = [
    "compute.googleapis.com",
    "container.googleapis.com"
  ] 

}