# Forigate cluster deployment with FortiAnalyzer and FortiManager
## Deployment overview

This Terraform configuration deploys a comprehensive FortiGate High Availability (HA) cluster with centralized management and logging capabilities on Google Cloud Platform. The deployment includes:

### Architecture Components

- **FortiGate HA Cluster**: Two FortiGate instances configured in active-passive HA mode for network security and traffic inspection
- **FortiAnalyzer (FAZ)**: Centralized logging, reporting, and analytics platform for security event management
- **FortiManager (FMG)**: Centralized management console for policy configuration and device management
- **Network Infrastructure**: 
    - Dedicated VPC for FortiGate cluster with multiple subnets
    - Spoke VPC for workload connectivity
    - External Load Balancer (XLB) for traffic distribution

### Key Features

- **High Availability**: Automatic failover between FortiGate instances ensures continuous protection
- **Centralized Management**: FortiManager provides unified policy management across the security fabric
- **Security Analytics**: FortiAnalyzer delivers comprehensive logging and threat intelligence
- **Scalable Architecture**: Spoke VPC design allows for easy expansion of protected workloads
- **Load Balancing**: External load balancer distributes traffic efficiently across the security infrastructure

### Use Cases

This deployment is ideal for organizations requiring:
- Enterprise-grade network security with redundancy
- Centralized security management and compliance reporting
- Secure connectivity for multi-tier applications
- Comprehensive security monitoring and analytics

The configuration automatically handles SSH key generation, network setup, and initial device configuration to provide a production-ready security infrastructure.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.48.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.3.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_faz"></a> [faz](#module\_faz) | ../../modules/faz | n/a |
| <a name="module_fgt"></a> [fgt](#module\_fgt) | ../../modules/fgt_ha | n/a |
| <a name="module_fgt_config"></a> [fgt\_config](#module\_fgt\_config) | ../../modules/fgt_config | n/a |
| <a name="module_fgt_vpc"></a> [fgt\_vpc](#module\_fgt\_vpc) | ../../modules/vpc_fgt | n/a |
| <a name="module_fmg"></a> [fmg](#module\_fmg) | ../../modules/fmg | n/a |
| <a name="module_vpc_spoke"></a> [vpc\_spoke](#module\_vpc\_spoke) | ../../modules/vpc_spoke | n/a |
| <a name="module_xlb"></a> [xlb](#module\_xlb) | ../../modules/xlb | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.ssh_private_key_pem](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.ssh-rsa](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [google_client_openid_userinfo.me](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/data-sources/client_openid_userinfo) | data source |
| [http_http.my-public-ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_project"></a> [project](#input\_project) | GCP resourcers prefix description | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP region | `string` | `"europe-west4"` | no |
| <a name="input_token"></a> [token](#input\_token) | n/a | `string` | `null` | no |
| <a name="input_zone1"></a> [zone1](#input\_zone1) | GCP zone | `string` | `"europe-west4-a"` | no |
| <a name="input_zone2"></a> [zone2](#input\_zone2) | GCP zone | `string` | `"europe-west4-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_faz"></a> [faz](#output\_faz) | n/a |
| <a name="output_fgt"></a> [fgt](#output\_fgt) | n/a |
| <a name="output_fmg"></a> [fmg](#output\_fmg) | n/a |
<!-- END_TF_DOCS -->

## Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.