resource "kubernetes_ingress" "skills_ingress" {
  metadata {
    name = "skills-ingress"
  }

  spec {
    backend {
      service_name = "skills"
      service_port = 8080
    }

    rule {
      http {
        path {
          backend {
            service_name = "skills"
            service_port = 8080
          }

          path = "/app1/*"
        }

      }
    }

    tls {
      secret_name = "tls-secret"
    }
  }
}

resource "kubernetes_pod" "skills" {
  metadata {
    name = "skills-nginx"
    labels = {
      app = "skills"
    }
  }

  spec {
    container {
      image = "nginx"
      name  = "skills-nginx"

      port {
        container_port = 8080
      }
    }
  }
}
