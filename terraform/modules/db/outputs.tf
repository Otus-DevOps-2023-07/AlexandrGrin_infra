output "external_ip_address_db" {
 value = yandex_compute_instance.db.0.network_interface.0.nat_ip_address
}
