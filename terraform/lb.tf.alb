resource "yandex_alb_target_group" "app-target-group" {
  name = "my-target-group"

  target {
    subnet_id  = var.subnet_id
    ip_address = yandex_compute_instance.app[0].network_interface.0.ip_address
  }

  target {
    subnet_id  = var.subnet_id
    ip_address = yandex_compute_instance.app[1].network_interface.0.ip_address
  }
}

resource "yandex_alb_backend_group" "app-backend-group" {
  name = "my-backend-group"

  http_backend {
    name             = "app-http-backend"
    weight           = 1
    port             = 9292
    target_group_ids = ["${yandex_alb_target_group.app-target-group.id}"]
    load_balancing_config {
      panic_threshold = 0
    }
    healthcheck {
      healthcheck_port = 9292
      timeout          = "1s"
      interval         = "1s"
      http_healthcheck {
        path = "/"
      }
    }
  }
}

resource "yandex_alb_http_router" "tf-router" {
  name = "first-http-router"
}

resource "yandex_alb_virtual_host" "app-virtual-host" {
  name           = "my-virtual-host"
  http_router_id = yandex_alb_http_router.tf-router.id
  route {
    name = "app-route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.app-backend-group.id
        timeout          = "3s"
      }
    }
  }
}

resource "yandex_alb_load_balancer" "load_balancer" {
  name = "first-load-balancer"

  network_id = var.network_id

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = var.subnet_id
    }
  }

  listener {
    name = "my-listener"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [9292]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.tf-router.id
      }
    }
  }

}
