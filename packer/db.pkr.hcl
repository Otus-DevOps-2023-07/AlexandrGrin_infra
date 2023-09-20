source "yandex" "ubuntu16_db" {
  service_account_key_file = var.service
  folder_id = "${var.folder}"
  subnet_id = "e9b11av5e1gbqshptqln"
  use_ipv4_nat = true
  preemptible = true
  source_image_family = "${var.source}"
  image_name = "reddit-db-${formatdate("MM-DD-YYYY", timestamp())}"
  image_family = "reddit-db"
  ssh_username = "ubuntu"
  platform_id = "standard-v1"
}

build {
  sources = ["source.yandex.ubuntu16_db"]

  provisioner "shell" {
    scripts = ["scripts/install_mongodb.sh"]
    execute_command = "sudo {{.Path}}"
  }

}
