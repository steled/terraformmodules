resource "kubernetes_config_map_v1" "metrics_proxy_config" {
  metadata {
    name      = "metrics-proxy-config"
    namespace = "kube-system"

    labels = {
      name = "metrics-proxy"
    }
  }

  data = {
    "haproxy.cfg" = <<EOF
defaults
  mode http
  timeout connect 5000ms
  timeout client 5000ms
  timeout server 5000ms
  default-server maxconn 10

frontend kube-controller-manager-frontend
  bind $${NODE_IP}:10252
  http-request deny if !{ path /metrics }
  default_backend kube-controller-manager-backend
backend kube-controller-manager-backend
  server kube-controller-manager 127.0.0.1:10257 ssl verify none

frontend kube-scheduler-frontend
  bind $${NODE_IP}:10251
  http-request deny if !{ path /metrics }
  default_backend kube-scheduler-backend
backend kube-scheduler-backend
  server kube-scheduler 127.0.0.1:10259 ssl verify none

frontend kube-proxy-frontend
  bind $${NODE_IP}:10249
  http-request deny if !{ path /metrics }
  default_backend kube-proxy-backend
backend kube-proxy-backend
  server kube-proxy 127.0.0.1:10249

frontend kube-etcd-frontend
  bind $${NODE_IP}:2381
  http-request deny if !{ path /metrics }
  default_backend kube-etcd-backend
backend kube-etcd-backend
  server kube-etcd 127.0.0.1:2381
EOF
  }
}

resource "kubernetes_daemon_set_v1" "metrics_proxy" {
  metadata {
    name      = "metrics-proxy"
    namespace = "kube-system"

    labels = {
      name = "metrics-proxy"
    }
  }

  spec {
    selector {
      match_labels = {
        name = "metrics-proxy"
      }
    }

    template {
      metadata {
        labels = {
          name = "metrics-proxy"
        }
      }

      spec {
        host_network                     = true
        restart_policy                   = "Always"
        termination_grace_period_seconds = 30

        container {
          image = "haproxy:${var.haproxy_version}"
          name  = "metrics-proxy"

          env {
            name = "NODE_IP"
            value_from {
              field_ref {
                api_version = "v1"
                field_path  = "status.hostIP"
              }
            }
          }

          resources {
            limits = {
              cpu    = "500m"
              memory = "200Mi"
            }
            requests = {
              cpu    = "50m"
              memory = "175Mi"
            }
          }

          volume_mount {
            name       = "config"
            mount_path = "/usr/local/etc/haproxy"
          }
        }

        toleration {
          effect   = "NoSchedule"
          key      = "node-role.kubernetes.io/master"
          operator = "Exists"
        }

        volume {
          name = "config"
          config_map {
            name = kubernetes_config_map_v1.metrics_proxy_config.metadata[0].name
          }
        }
      }
    }
  }
}
