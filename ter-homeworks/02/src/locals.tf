locals {
  vm_name    = "${var.vm_name}-${var.default_zone}-web"
  vm_db_name = "${var.vm_name}-${var.vm_db_zone}-db"
}
