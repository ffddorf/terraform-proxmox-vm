# Terraform Proxmox VM

## Description

This repo contains code to thes the provisioning of virtual machines on Proxmox.

We are using a Terraform workspace to remotely execute the code and store the state.

## Preparation

A Running Proxmox Virtualization Environment (PVE) cluster with the following:

* Resource pool for the testing
* Basic virtual machine (VM) with QEMU guest agent installed
* User account for Terraform
* Role for Terraform with only the required permissions in the pool

A Terraform workspace with the following environment variables:

* `PROXMOX_VE_ENDPOINT` = `https://pve.freifunk-duesseldorf.de`	
* `PROXMOX_VE_USERNAME` = `terraform@pve`
* `PROXMOX_VE_PASSWORD` = `secure-password-that-has-been-redacted`

We use a CLI driven workflow and execute the Terraform command from a workstation.

## Notes

* VM is created by cloning a template VM, which is very fast. No further provisioning is required, as everything is already prepared  in the template. See [Proxmox Wiki](https://pve.proxmox.com/wiki/VM_Templates_and_Clones).
* Official cloud-ready Debian images are avaiable that work very well as a base. See [Debian Cloud](https://cloud.debian.org/images/cloud/).
* The package 'qemu-guest-agent' has to be installed, otherwise shutdowns don't work and the VM cannot be deleted automatically. We did that manually for this trial. See [Proxmox Wiki](https://pve.proxmox.com/wiki/Qemu-guest-agent).
* Some configuration of the VM can be done with cloud-init. This is limited to network settings and user accounts. See [Terraform Proxmox Module](https://registry.terraform.io/providers/danitso/proxmox/latest/docs/resources/virtual_environment_vm#initialization).
* Further provisioning of the VM should be done with another provider, ideally *before* creating the VM, when preparing the template. See [Packer Proxmox Builder ](https://www.packer.io/docs/builders/proxmox/clone).
