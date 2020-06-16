resource "kubernetes_deployment" "example" {
  metadata {
    name = "deployment-terraform"
    labels = {
      app = "cicddemo"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "cicddemo"
      }
    }

    template {
      metadata {
        labels = {
          app = "cicddemo"
        }
      }

      spec {
        container {
          image = "kishorsg/my-app:2.0.0"
          name  = "deployment-terraform-ctr"

          resources {
            limits {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests {
              cpu    = "250m"
              memory = "50Mi"
            }
          }

         
        }
      }
    }
  }
}
