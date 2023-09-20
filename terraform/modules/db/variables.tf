variable "cloud_id" {
  description = "Cloud"
  default     = "b1gnumuvqqjklvn0et41"
}

variable "folder_id" {
  description = "Folder"
  default     = "b1go7k8v0u9ccglokjl8"
}

variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}

variable "network_id" {
  description = "Network ID"
  default     = "enpq1nlbbe38mhbp2cbi"
}

variable "subnet_id" {
  description = "Subnet ID"
  default     = "e9b11av5e1gbqshptqln"
}

variable "service_account_key_file" {
  description = "key.json"
  default     = "../../../../key.json"
}

variable "privite_key" {
  description = "privite_key"
  default     = "~/.ssh/id_ed25519"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
  default     = "../../../../user.yaml"
}

variable "count_app" {
  description = "count"
  default     = "1"
}

variable app_disk_image {
 description = "Disk image for reddit app"
 default = "fd8hrmmo4sfv2jkb24ju"
}

variable db_disk_image {
 description = "Disk image for reddit db"
 default = "fd8h2ehq5cq3vgjnhe3s"
}
