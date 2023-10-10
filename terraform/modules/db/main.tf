terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_instance" "db" {
  name        = "reddit-db"
  labels = {
    tags = "reddit-app"
  }
  zone        = var.zone
  platform_id = "standard-v2"
  count       = var.count_app

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 50
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    user-data = file(var.public_key_path)
  }

}
