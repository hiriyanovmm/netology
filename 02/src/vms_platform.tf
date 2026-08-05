variable "vm_name" {
  type        = string
  default     = "netology-develop-platform"
  description = "VM name"
}

#variable "vm_db_name" {
#  type        = string
#  default     = "netology-develop-platform-db"
#  description = "VM DB name"
#}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "Zone for VM DB"
}

variable "vms_resources" {
  type = map(object({
    cores         = number
    memory        = number
    core_fraction = number
    hdd_size      = number
    hdd_type      = string
  }))
}
#  default = {
#    web = {
#      cores         = 2
#      memory        = 1
#      core_fraction = 5
#      hdd_size      = 5
#      hdd_type      = "network-hdd"
#    }
#    db = {
#      cores         = 2
#      memory        = 2
#      core_fraction = 20
#      hdd_size      = 5
#      hdd_type      = "network-hdd"
#    }
#  }
#}
