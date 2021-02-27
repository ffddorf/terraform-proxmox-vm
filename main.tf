terraform {
  backend "remote" {
    organization = "ffddorf"

    workspaces {
      name = "proxmox-vm-dev"
    }
  }
  required_providers {
    proxmox = {
      source = "danitso/proxmox"
      version = "0.4.4"
    }
  }
}

provider "proxmox" {
  virtual_environment {}
}

resource "proxmox_virtual_environment_vm" "test" {
  node_name = "pm2"
  pool_id = "Testing"
  clone {
    vm_id = "109"
  }
  agent {
    enabled = true
  }
}
