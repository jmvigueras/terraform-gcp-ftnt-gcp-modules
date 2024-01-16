# List of modules for GCP deployments

This is a collection of modules for GCP deployments. You can find an example of how to use each module in example folder. 

## List of modules
- [module faz](./modules/faz)
- [module fgt_config](./modules/fgt-config)
- [module fgt_ha](./modules/fgt-ha)
- [module fmg](./modules/fmg)
- [module ncc](./modules/ncc)
- [module proxy](./modules/proxy) 
- [module vpc_fgt](./modules/vpc_fgt)
- [module vnet_spoke](./modules/vnet_spoke)
- [module xlb](./modules/xlb)
      
## Deployment considerations:
   - Create file terraform.tfvars using terraform.tfvars.example as template 
   - Update variables in var.tf with fortigate cluster deployment
   - You will be charged for this deployment

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
* Check particulars requiriments for each deployment (AWS) 

# Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.

