terraform {
  required_version = "~> 1.2.8"

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.17.0"
    }
  }
}
