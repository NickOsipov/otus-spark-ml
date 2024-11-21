# Создание диска и виртуальной машины
resource "yandex_compute_disk" "boot_disk" {
  name     = "boot-disk"
  zone     = var.zone
  image_id = var.image_id
  size     = 30
}

resource "yandex_compute_instance" "this" {
  name                      = var.instance_name
  allow_stopping_for_update = true
  platform_id               = "standard-v3"
  zone                      = var.zone
  service_account_id        = var.service_account_id
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
    user-data = <<-EOF
      #!/bin/bash
      mkdir -p /home/ubuntu/.ssh
      echo "${file(var.private_key_path)}" > /home/ubuntu/.ssh/dataproc
      chmod 600 /home/ubuntu/.ssh/dataproc
      chown ubuntu:ubuntu /home/ubuntu/.ssh/dataproc
      eval `ssh-agent -s`
      ssh-add /home/ubuntu/.ssh/dataproc
    EOF
  }

  scheduling_policy {
    preemptible = true
  }

  resources {
    cores  = "2"
    memory = "16"
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot_disk.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

}