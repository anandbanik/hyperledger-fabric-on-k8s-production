## Directory structure:

* envars: Contains all the global variables used by terragrunt modules.
* modules: Contains all the terragrunt modules.
* applications: Contains all services terraform code.
* scripts: Contains any other bash scripts used for project.


## To manage multiple terraform modules we have used Terragrunt:

Terragrunt is a thin wrapper for Terraform that provides extra tools for working with multiple Terraform modules. 

if you need a quick start, follow below steps:

```
# Install terraform and terragrunt
# set the `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` on your terminal
# use terragrunt to deploy
$ cd applications
$ for example, you want to deploy test-application.
$ cd test-application/
$ terragrunt init [This will initialise terragrunt module with s3 as a backend]
$ terragrunt apply [This will create the infra]
$ terragrunt destroy [This will destroy the infra]

```
