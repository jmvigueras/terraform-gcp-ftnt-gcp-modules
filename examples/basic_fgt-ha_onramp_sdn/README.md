# Fortigate cluster deployment with HA managed by FortiGate SDN Connector

## Deployment overview

This example demonstrates deploying a FortiGate cluster in high availability (HA) configuration on Google Cloud Platform (GCP), managed by the FortiGate SDN Connector. The deployment creates a resilient network security solution with automatic failover capabilities.

### Architecture Components

- **FortiGate HA Cluster**: Two FortiGate instances configured in active-passive HA mode
- **VPC Network**: Dedicated VPC with multiple subnets for management, public, and private traffic
- **SDN Connector**: Enables automatic route updates and IP failover without requiring GCP API access
- **Spoke VM**: Test virtual machine to validate traffic flow through the FortiGate cluster
- **Route Configuration**: Custom routes directing traffic through the FortiGate cluster

### Key Features

- **Automatic Failover**: SDN Connector manages IP and route failover between FortiGate instances
- **Multi-Zone Deployment**: FortiGate instances deployed across different availability zones for resilience
- **Secure Access**: SSH key pair generation for secure management access
- **Traffic Inspection**: All north-south and east-west traffic routed through FortiGate security policies

### Deployment Flow

1. Creates VPC networks and subnets for FortiGate deployment
2. Deploys FortiGate HA cluster with SDN Connector configuration
3. Configures routing to direct traffic through the FortiGate cluster
4. Provisions test VM in spoke network for validation
5. Generates SSH keys for secure management access

This setup provides enterprise-grade network security with high availability and automatic failover capabilities in GCP.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.48.0 |
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fgt"></a> [fgt](#module\_fgt) | ../../modules/fgt_ha | n/a |
| <a name="module_fgt_config"></a> [fgt\_config](#module\_fgt\_config) | ../../modules/fgt_config | n/a |
| <a name="module_fgt_vpc"></a> [fgt\_vpc](#module\_fgt\_vpc) | ../../modules/vpc_fgt | n/a |
| <a name="module_vm_spoke"></a> [vm\_spoke](#module\_vm\_spoke) | ../../modules/vm | n/a |

## Resources

| Name | Type |
|------|------|
| [google_compute_route.private_route_to_fgt_default](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/resources/compute_route) | resource |
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
| <a name="output_vm_spoke"></a> [vm\_spoke](#output\_vm\_spoke) | n/a |
<!-- END_TF_DOCS -->