output "lb_ip_address_app" {
  value = yandex_alb_load_balancer.load_balancer.listener[0].endpoint[0].address[0].external_ipv4_address[0].address
}

output "external_ip_address_app_0" {
  value = yandex_compute_instance.app[0].network_interface[0].nat_ip_address
}

output "external_ip_address_app_1" {
  value = yandex_compute_instance.app[1].network_interface[0].nat_ip_address
}
