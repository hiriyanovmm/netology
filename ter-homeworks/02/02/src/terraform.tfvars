vms_resources = {
  web = {
    cores         = 2
    memory        = 1
    core_fraction = 5
    hdd_size      = 5
    hdd_type      = "network-hdd"
  }
  db = {
    cores         = 2
    memory        = 2
    core_fraction = 20
    hdd_size      = 5
    hdd_type      = "network-hdd"
  }
}

vms_ssh_root_key = {
  serial-port-enable = 1
  ssh-keys           = "ubuntu:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCS3EYC/9QeRo6O1KVhVLfz4zagJTNtPJOyIJpu+BgvRfC2Tt7TCHfeerDUBXMKb186NEvh6KSGHvb0OPXN+isHIDeUud7dzJlX5Fcv5JVqjsHR20SLQZuj/I+eprtYdvkRXAxiaBNztJz0lQw93dAUMZFT5NS57i3ZaQ/GS+hk/4xeftVwZlclPdCwtb7U6W5X0+J4Mp3t/SwSR9wzwrbKMDlwQynsZVZ85QqobN2d14E2Jj8JVXrIX8Msg8KapN8kolkh/ECTKYOLpU5qj0GVCHZVQ3dcmscUrEd11sRlRve+c/ZoUTTiRB11ojF9sih3T5wFKd3how4hOxM0USvH adm_hiryanov"
}
