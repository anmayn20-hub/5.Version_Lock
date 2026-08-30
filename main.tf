#The .terraform.lock.hcl file is Terraform's dependency lock file. 
#  It records the exact provider versions and checksums that Terraform downloaded, 
#  ensuring everyone using the configuration gets the same provider versions.
#When you run: terraform init, Terraform downloads the required providers and automatically creates:
#  .terraform/
#  .terraform.lock.hcl

terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "4.70.0"
    }
  }
}

provider "azurerm" {
  features { }
}

resource "azurerm_resource_group" "RG_Demo" {
  name = "demo_rg"
  location = "central india"
}

# Version locking: If another person runs: terraform init, Terraform will install exactly:hashicorp/azurerm v4.70.0
# instead of automatically downloading a newer version.
# Security: The hash values verify that the downloaded provider hasn't been altered or corrupted.
# Reproducible deployments: Everyone on the team, CI/CD pipelines, and different environments use the same provider versions.

#If you want to change the provider version, 
#you should update the version constraint in your Terraform configuration 
#and then tell Terraform to upgrade the provider.
# terraform init -upgrade
#Download the new provider version.
#Update .terraform.lock.hcl.
#Keep your configuration and state intact.