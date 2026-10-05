variable "name" {
  type = string
}

resource "kubernetes_namespace" "this" {
  metadata {
    name = var.name
  }

  lifecycle {
    ignore_changes = [
      metadata[0].annotations
    ]
  }
}

output "name" {
  value = kubernetes_namespace.this.metadata[0].name
}
