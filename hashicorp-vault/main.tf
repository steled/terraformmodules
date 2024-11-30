terraform {
  required_version = "~> 1.10.0"

  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.16.1"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.34.0"
    }
    kubectl = {
      source  = "alekc/kubectl"
      version = "~> 2.1.3"
    }
  }
}
