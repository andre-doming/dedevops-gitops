terraform {
  required_version = ">= 1.16.0"

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.38"
    }
  }
}

provider "kubernetes" {
  config_path = "/etc/rancher/k3s/k3s.yaml"
}

resource "kubernetes_namespace" "terraform_system" {
  metadata {
    name = "terraform-system"
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations
    ]
  }
}
