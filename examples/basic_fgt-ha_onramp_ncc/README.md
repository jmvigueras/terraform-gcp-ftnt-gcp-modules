# Fortigate cluster deployment with GCP Network Connectivity Center (NCC)

This example demonstrates how to deploy a highly available Fortigate cluster integrated with Google Cloud Platform's Network Connectivity Center (NCC). The deployment creates a secure network infrastructure with centralized connectivity management through NCC's hub-and-spoke architecture.

## Architecture

The deployment includes:
- **Fortigate HA Cluster**: Two Fortigate instances configured in active-passive mode for high availability
- **VPC Networks**: Dedicated VPCs for Fortigate management, internal/external traffic, and spoke networks
- **Network Connectivity Center**: Central hub for managing hybrid and multi-cloud connectivity
- **Bastion Host**: Secure access point for management operations
- **Private Connectivity**: NCC integration for seamless network routing and management

## Key Features

- High availability Fortigate deployment across multiple zones
- Integration with GCP Network Connectivity Center for centralized network management
- Automated Fortigate configuration and bootstrapping
- Secure SSH key generation and management
- Spoke VPC connectivity through NCC hub
- Bastion host for secure administrative access

## Prerequisites

- GCP project with appropriate permissions
- Terraform >= 0.13
- Valid Fortigate licenses (BYOL or PAYG)
- Network Connectivity Center API enabled in your GCP project

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.48.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.2.1 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.3.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fgt"></a> [fgt](#module\_fgt) | ../../modules/fgt_ha | n/a |
| <a name="module_fgt_config"></a> [fgt\_config](#module\_fgt\_config) | ../../modules/fgt_config | n/a |
| <a name="module_fgt_vm_bastion"></a> [fgt\_vm\_bastion](#module\_fgt\_vm\_bastion) | ../../modules/vm | n/a |
| <a name="module_fgt_vpc"></a> [fgt\_vpc](#module\_fgt\_vpc) | ../../modules/vpc_fgt | n/a |
| <a name="module_ncc_private"></a> [ncc\_private](#module\_ncc\_private) | ../../modules/ncc | n/a |
| <a name="module_vpc_spoke"></a> [vpc\_spoke](#module\_vpc\_spoke) | ../../modules/vpc_spoke | n/a |

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
| <a name="output_fgt"></a> [fgt](#output\_fgt) | n/a |
<!-- END_TF_DOCS -->

## Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.