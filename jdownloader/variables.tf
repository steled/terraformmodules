variable "ssh_user" {
  type = string
  description = "Username for SSH connection"
}

variable "ssh_host" {
  type = string
  description = "Host for SSH connection"
}

variable "namespace" {
  type = string
  description = "Name of the kubernetes namespace"
}

variable "env_jd_devicename" {
  type = string
}

variable "env_jd_password" {
  type = string
}

variable "env_jd_email" {
  type = string
}

variable "sftp_values_yaml" {
  type = string
  description = "Path to the values.yml file, relative to the root module"
}

variable "sftp_ip_address" {
  type        = string
  description = "IP address for SFTP service"
}

variable "rsync_upload_id_rsa" {
  type        = string
  description = "Path to the upload.id_rsa file"
}

variable "rsync_dst_folder_path" {
  type        = string
  description = "Destination folder path for rsync cronjob"
}

variable "rsync_dst_ip_address" {
  type        = string
  description = "Destination ip address for rsync cronjob"
}

variable "rsync_username" {
  type        = string
  description = "Username for rsync cronjob"
}

variable "rsync_src_folder_path" {
  type        = string
  description = "Source folder path for rsync cronjob"
}