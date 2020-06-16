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


resource "kubernetes_service" "example" {
  metadata {
    name = "deployment-terraform"
  }
  spec {
    selector = {
      app = "${kubernetes_pod.example.metadata.0.labels.app}"
    }
    session_affinity = "ClientIP"
    port {
      port        = 8085
      target_port = 8080
    }

    type = "LoadBalancer"
  }
}
