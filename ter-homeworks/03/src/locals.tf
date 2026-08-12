# locals.tf
locals {
  ssh_public_key = file("~/.ssh/adm_hiryanov_pub")

  vm_metadata = {
    ssh-keys = "ubuntu:${local.ssh_public_key}"
  }
}