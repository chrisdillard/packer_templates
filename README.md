# packer_templates

Packer templates using the vmware-iso builder for Windows and Linux and targeting a remote ESXi host. Minimal base configurations are set with the expectation that a config mgmt tool such as Chef will pick up from there. 

## Prerequisites
* [Packer](https://www.packer.io/)
* Remote ESXi host configured for Packer connectivity (or VMWare Workstation if you remove the "remote_type" string to run locally)
* Server 2012r2/2016 or CentOS 6/7 ISO's

## Building from a template
<code> packer build -force -var-file .\variable\2016_var.json .\2016.json </code>
