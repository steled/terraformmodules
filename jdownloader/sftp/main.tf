terraform {
  required_version = "~> 1.10"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.9"
    }
  }
}
