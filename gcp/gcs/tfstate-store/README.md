# How to create a tfstate bucket and save its tfsate file remotely

## 1. Create bucket and store tfstate file locally
- In terragrunt module, comment `remote_state` block in order to save locally the tfstate file.
- In terraform module, comment `terraform { backend “gcs” {} }`
- Before to execute the following command, please ensure that your terragrunt workspace is clean, then execute to create local authentication credentials for your user account:
`gcloud auth application-default login`
- Execute terragrunt init and then terragrunt apply.

## 2. Migrate tfstate locally to remote bucket (using terragrunt)
- In terragrunt module, uncomment `remote_state` block
- In terragrunt module, go to the autocreated `terragrunt-cache` folder by first execution then search for `../gcp/gcs/config.tf` file and uncomment terraform `{ backend “gcs” {} }`
- Execute the command:
`terragrunt init -migrate-state`

That's all!! The tfstate was migrated to tfstate bucket, check it in GCP console.
