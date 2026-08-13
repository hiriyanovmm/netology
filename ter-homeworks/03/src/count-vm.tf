resource "yandex_compute_instance" "web" {
  count = 2

  name        = "web-${count.index + 1}"
  zone        = var.default_zone
  platform_id = "standard-v3"

  depends_on = [
    yandex_compute_instance.db
  ]

  resources {
    cores  = var.web_vm.cpu
    memory = var.web_vm.ram
    core_fraction = var.web_vm.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = local.image_id
      size     = var.web_vm.disk_volume
      type     = var.disk_type
    }
  }

  scheduling_policy {
    preemptible = true
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = local.vm_metadata
}