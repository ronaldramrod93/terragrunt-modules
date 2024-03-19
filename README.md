# pf_tg-modules

## Pre requesites
- Authentication
    - If you think to use the modules **locally** I recommend authenticate using [User Application Default Credentials ("ADCs")](https://cloud.google.com/sdk/gcloud/reference/auth/application-default) as a primary authentication method. You can enable ADCs by running the command: `gcloud auth application-default login`

## Usage
In order to use the tg modules listed here you have to follow the next steps:
1. Create a folder inside the terragrunt module you will use and put a name related with the resource you will create. For instance:
    ```
    -> service account folder (terragrunt module folder)
        -> terragrunt.hcl (general configuration and terraform module used)
        -> gke-sa (folder with terragrunt configuration to create a SA used in GKE cluster)
            -> terragrunt.hcl
        -> cicd-sa (folder with terragrunt configuration to create a SA used in CICD process)
            -> terragrunt.hcl
    ...
    ```    

2. Add the below lines in the top of your terragrunt file in order to be able use the generic configuration.
   ```
   include "root" {
      path = find_in_parent_folders()
   }
   ```
4. Execute your terragrunt configuration using github actions, Go to `Actions` then in `Workflows` section, select `terragrunt` option and finally push `Run workflow` and add the path of your terragrunt file.
