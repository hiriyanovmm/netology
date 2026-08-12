resource "yandex_compute_instance" "db" {
  for_each = {
    for vm in var.each_vm : vm.vm_name => vm
  }

  name        = each.value.vm_name
  zone        = var.default_zone
  platform_id = "standard-v3"

  resources {
    cores  = each.value.cpu
    memory = each.value.ram
    core_fraction = each.value.core_fraction
  }
  
  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
      size     = each.value.disk_volume
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id = yandex_vpc_network.develop.id
    nat       = true
  }

  metadata = local.vm_metadata
}