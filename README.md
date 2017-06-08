
# DGX-1 provisioning with MAAS and Ansible
 
> MAAS: https://maas.io/

> Ansible: https://www.ansible.com/
  
## Installing and configuring MAAS to provision DGX-1

> Instructions written for DGX-1 base OS image 3.0
   
* Install MAAS on dedicated HW or VM
    * Typically same VLAN but MAAS can handle tagged interfaces now
    * Configure networks and OS images
    * Configure commissioning OS to be Ubuntu 16.04 and default OS to be Ubuntu 16.04
* Rack and connect DGX-1
* Set DGX-1 to PXE boot from desired 10GbE interface
* DGX-1 will boot under MAAS direction in the enlistment phase and show up as “new” in MAAS
* Commission node; DGX-1 shows as “ready” when completed
* Modify DGX-1 in MAAS
    * Configure network
    * Create mount point for sdb (RAID0 array)
        * Mount to “/raid”
        * Options: “defaults,nofail”
* Deploy node using Ubuntu 16.04 LTS (Xenial) with default kernel (ga-16.04)


## Provisioning software with Ansible

Install required external roles:

`ansible-playbook bootstrap.yml`

Deploy:

`ansible-playbook -i inventory -l dgx site.yml`
