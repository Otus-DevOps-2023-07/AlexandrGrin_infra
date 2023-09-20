source "yandex" "ubuntu16_app" {
  service_account_key_file = var.service
  folder_id = "${var.folder}"
  subnet_id = "e9b11av5e1gbqshptqln"
  use_ipv4_nat = true
  preemptible = true
  source_image_family = "${var.source}"
  image_name = "reddit-app-${formatdate("MM-DD-YYYY", timestamp())}"
  image_family = "reddit-app"
  ssh_username = "ubuntu"
  platform_id = "standard-v1"
}

build {
  sources = ["source.yandex.ubuntu16_app"]

  provisioner "shell" {
    scripts = [ "scripts/install_ruby.sh"]
    execute_command = "sudo {{.Path}}"
  }

}
