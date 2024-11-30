terraform {
  required_version = "~> 1.10.0"

  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "~> 2.34.0"
    }
  }
}
