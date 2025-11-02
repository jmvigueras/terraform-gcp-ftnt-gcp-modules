# List of modules for GCP deployments

This is a collection of modules for GCP deployments. You can find an example of how to use each module in example folder. 

## List of modules
- [module faz](./modules/faz) - FortiAnalyzer deployment module
- [module fgt-config](./modules/fgt-config) - FortiGate configuration module
- [module fgt-ha](./modules/fgt-ha) - FortiGate High Availability cluster module
- [module fmg](./modules/fmg) - FortiManager deployment module
- [module ncc](./modules/ncc) - Network Connectivity Center module
- [module proxy](./modules/proxy) - Proxy server deployment module
- [module vpc-fgt](./modules/vpc-fgt) - VPC with FortiGate integration module
- [module vnet-spoke](./modules/vnet-spoke) - Virtual network spoke module
- [module xlb](./modules/xlb) - External load balancer module

## Deployment considerations
- Create file `terraform.tfvars` using `terraform.tfvars.example` as template
- Update variables in `variables.tf` with your specific deployment requirements
- Review module-specific documentation in each module's folder
- Ensure proper GCP credentials and permissions are configured
- You will be charged for this deployment by Google Cloud Platform

## Requirements
- [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 0.12.0
- Google Cloud SDK configured with appropriate credentials
- Sufficient GCP quotas for the resources being deployed
- Check particular requirements for each module deployment in their respective documentation

## Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.

