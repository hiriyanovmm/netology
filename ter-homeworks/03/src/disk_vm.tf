resource "yandex_compute_disk" "storage_disk" {
  count = var.storage_disk.count

  name = "storage-disk-${count.index + 1}"
  type = var.disk_type
  zone = var.default_zone
  size = var.storage_disk.size
}

resource "yandex_compute_instance" "storage" {
  name        = "storage"
  zone        = var.default_zone
  platform_id = "standard-v3"

  resources {
    cores  = var.storage_vm.cpu
    memory = var.storage_vm.ram
    core_fraction = var.storage_vm.core_fraction
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      size     = var.storage_vm.disk_volume
      type     = var.disk_type
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.develop.id
    nat                = true
    #security_group_ids = [yandex_vpc_security_group.example.id]
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.storage_disk
    content {
      disk_id = secondary_disk.value.id
      mode    = "READ_WRITE"
    }
  }

  metadata = local.vm_metadata
}