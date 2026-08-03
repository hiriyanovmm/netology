terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5.1"
    }
  }
}

provider "docker" {
  host = "ssh://adm_hiryanov@ter-homeworks-01:22"
  ssh_opts = [
    "-o", "StrictHostKeyChecking=no",
    "-o", "UserKnownHostsFile=/dev/null"
  ]
}

resource "random_password" "root" {
  length  = 16
  special = true
}

resource "random_password" "user" {
  length  = 16
  special = true
}

resource "docker_image" "mysql" {
  name = "mysql:8"
}

resource "docker_container" "mysql" {
  name  = "mysql"
  image = docker_image.mysql.image_id

  ports {
    internal = 3306
    external = 3306
    ip       = "127.0.0.1"
  }

  env = [
    "MYSQL_ROOT_PASSWORD=${random_password.root.result}",
    "MYSQL_DATABASE=wordpress",
    "MYSQL_USER=wordpress",
    "MYSQL_PASSWORD=${random_password.user.result}",
    "MYSQL_ROOT_HOST=%"
  ]
}
