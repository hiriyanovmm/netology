## Задача 1



## Задача 2




## Задача 3
```hcl
packer {
  required_plugins {
    yandex = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/yandex"
    }
  }
}

variable "yc_token" {
  type      = string
  sensitive = true
  default   = env("YC_TOKEN")
}

source "yandex" "debian_docker" {
  token                = var.yc_token
  folder_id            = "b1gl4ritu3jghgdhulun"
  zone                 = "ru-central1-a"
  image_name           = "debian-11-docker"
  image_description    = "my custom debian with docker"
  source_image_family  = "debian-11"
  subnet_id            = "e9bfn86e7jdecpcu2las"
  use_ipv4_nat         = true
  disk_type            = "network-hdd"
  ssh_username         = "debian"

  ssh_timeout              = "15m"
  ssh_handshake_attempts   = 100
  pause_before_connecting  = "60s"

  metadata = {
    user-data = file("user-data.yml")
  }
}

build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [
      "echo 'hello from packer'",
      "sudo apt-get update -y",
      "sudo apt-get install -y htop tmux"
    ]
  }

  provisioner "shell" {
    inline = [
      # Uninstall old versions
      "for pkg in docker.io docker-compose docker-doc podman-docker containerd runc; do sudo apt-get remove -y $pkg 2>/dev/null || true; done",

      # Set up Docker's apt repository
      "sudo apt-get update -y",
      "sudo apt-get install -y ca-certificates curl",

      # Add Docker's official GPG key
      "sudo install -m 0755 -d /etc/apt/keyrings",
      "sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc",
      "sudo chmod a+r /etc/apt/keyrings/docker.asc",

      # Add the repository to Apt sources
      "echo \"Types: deb\\nURIs: https://download.docker.com/linux/debian\\nSuites: $(. /etc/os-release && echo $VERSION_CODENAME)\\nComponents: stable\\nArchitectures: $(dpkg --print-architecture)\\nSigned-By: /etc/apt/keyrings/docker.asc\" | sudo tee /etc/apt/sources.list.d/docker.sources",

      # Apt update and install Docker
      "sudo apt-get update -y",
      "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin",
    ]
  }
}
```


