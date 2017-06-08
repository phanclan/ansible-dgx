
# DGX-1 provisioning with MAAS and Ansible
 
> MAAS: https://maas.io/

> Ansible: https://www.ansible.com/
  
Ansible playbook for provisioning DGX-1 running vanilla Ubuntu 16.04 via MAAS to match official DGX-1 base OS 3.x images.

## Installing and configuring MAAS to provision DGX-1

> Instructions written for DGX-1 base OS image 3.0 (Ubuntu 16.04 LTS)
   
* Install MAAS on dedicated HW or VM
    * To simplify things you should use a single VLAN but MAAS can handle tagged interfaces
    * Configure networks to match your site
    * Download Ubuntu 16.04 OS images
    * Configure commissioning OS to be Ubuntu 16.04 and default OS to be Ubuntu 16.04, using the default kernels
* Rack and connect DGX-1 to the appropriate network via 10GBASE-T
* Set DGX-1 to PXE boot from desired 10GbE interface
* DGX-1 will boot under MAAS direction in the enlistment phase and show up as "new" in MAAS
* Commission node; DGX-1 shows as "ready" when completed
* Modify DGX-1 in MAAS:
    * Edit the primary interface and select the appropriate subnet and IP setting
    * Edit the `sdb` device from the available disks and create a mount point (RAID0 array)
        * Mount to `/raid`
        * Options: `defaults,nofail`
    * The main OS disk `sda` should be configured properly by default
* Deploy node using Ubuntu 16.04 LTS (Xenial) with default kernel (ga-16.04)
* Provision software on the DGX-1 using Ansible

## Provisioning software with Ansible

Install required external roles:

`ansible-playbook bootstrap.yml`

Deploy:

`ansible-playbook -i inventory -l dgx site.yml`
