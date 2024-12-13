resource "kubernetes_cron_job_v1" "rsync_cronjob" {
  metadata {
    name      = "rsync"
    namespace = kubernetes_namespace.jd-sftp.metadata[0].name
  }
  spec {
    concurrency_policy        = "Replace"
    failed_jobs_history_limit = 5
    # schedule                      = "@hourly"
    schedule                      = "0 4 * * *"
    starting_deadline_seconds     = 10
    successful_jobs_history_limit = 0
    job_template {
      metadata {}
      spec {
        backoff_limit              = 2
        ttl_seconds_after_finished = 10
        template {
          metadata {}
          spec {
            container {
              command = [
                "/bin/sh",
                "-c",
              "apk add --update --no-cache rsync openssh-client &>/dev/null && rm -rf /var/cache/apk/* && rsync -ave \"ssh -i ~/.ssh/upload.id_rsa -o StrictHostKeyChecking=no\" ${var.rsync_src_folder_path} ${var.rsync_username}@${var.rsync_dst_ip_address}:${var.rsync_dst_folder_path}"]
              image             = "alpine:latest"
              image_pull_policy = "IfNotPresent"
              name              = "rsync"
              volume_mount {
                # mount_path = "/ext/persistent/jdownloader/downloads"
                mount_path = kubernetes_persistent_volume.jd-sftp-downloads-pv.spec[0].persistent_volume_source[0].host_path[0].path
                name       = "downloads-lailaps"
              }
              volume_mount {
                mount_path = "/root/.ssh"
                name       = "rsync-ssh-key"
              }
            }
            volume {
              name = "downloads-lailaps"
              persistent_volume_claim {
                claim_name = kubernetes_persistent_volume_claim.jd-sftp-downloads-pvc.metadata[0].name
              }
            }
            volume {
              name = "rsync-ssh-key"
              secret {
                default_mode = "0600"
                secret_name  = "rsync"
              }
            }
            restart_policy = "OnFailure"
          }
        }
      }
    }
  }
}
