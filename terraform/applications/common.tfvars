terragrunt = {
  remote_state {
    backend = "s3"
    config {
      bucket = "abc.bucketname"
      key   = "terraform_state/application_name/${path_relative_to_include()}/terraform.tfstate"
      region = "us-east-1"
      encrypt        = true
      dynamodb_table = "disposable-terraform-locks"

      s3_bucket_tags {
        owner = "disposable_setup"
        name  = "disposable setup terraform state storage"
      }

      dynamodb_table_tags {
        owner = "disposable_setup"
        name  = "disposable setup terraform state storage"
      }
    }
  }

  terraform {
    extra_arguments "common_vars" {
      commands = ["${get_terraform_commands_that_need_vars()}"]
      arguments = [
        "-var-file=${get_parent_tfvars_dir()}/../envars/production.tfvars",
      ]
    }
  }
}