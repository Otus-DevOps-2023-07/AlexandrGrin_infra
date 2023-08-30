source "yandex" "ubuntu16full" {
  service_account_key_file = "${var.service}"
  folder_id = "${var.folder}"
  subnet_id = "e9b11av5e1gbqshptqln"
  use_ipv4_nat = true
  preemptible = true
  source_image_family = "${var.source}"
  image_name = "reddit-full-${formatdate("MM-DD-YYYY", timestamp())}"
  image_family = "reddit-full"
  ssh_username = "ubuntu"
  platform_id = "standard-v1"
}

build {
  sources = ["source.yandex.ubuntu16full"]

  provisioner "shell" {
    script =  "files/install.sh"
    execute_command = "sudo {{.Path}}"
  }

}
