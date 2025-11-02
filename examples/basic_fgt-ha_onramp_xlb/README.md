# Fortigate cluster deployment with Load Balancers sandwich

> !Tip
> This is the recommended setup for HA in GCP

## Deployment overview

This example demonstrates the deployment of a highly available FortiGate cluster on Google Cloud Platform (GCP) using a load balancer sandwich architecture. The setup includes:

- **FortiGate HA Cluster**: Two FortiGate instances configured in FGCP (FortiGate Clustering Protocol) mode for high availability
- **Load Balancer Sandwich**: External and internal load balancers to distribute traffic and provide seamless failover
- **VPC Architecture**: Dedicated VPC for FortiGates with separate spoke VPCs for workload isolation
- **Cross-Zone Deployment**: FortiGates deployed across multiple availability zones for enhanced resilience

### Architecture Components

- **External Load Balancer (XLB)**: Handles incoming traffic and distributes it to the active FortiGate
- **FortiGate Cluster**: Primary and secondary FortiGate instances with synchronized configuration
- **Internal Networks**: Dedicated subnets for management, internal, and synchronization traffic
- **Spoke VPCs**: Isolated networks for application workloads with routing through the FortiGate cluster
- **Test VM**: Example workload deployed in spoke VPC to validate connectivity

This configuration provides enterprise-grade security with automatic failover capabilities and is the recommended approach for production FortiGate deployments in GCP.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.48.0 |
| <a name="provider_local"></a> [local](#provider\_local) | 2.4.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_fgt"></a> [fgt](#module\_fgt) | ../../modules/fgt_ha | n/a |
| <a name="module_fgt_config"></a> [fgt\_config](#module\_fgt\_config) | ../../modules/fgt_config | n/a |
| <a name="module_fgt_vpc"></a> [fgt\_vpc](#module\_fgt\_vpc) | ../../modules/vpc_fgt | n/a |
| <a name="module_vm_spoke"></a> [vm\_spoke](#module\_vm\_spoke) | ../../modules/vm | n/a |
| <a name="module_vpc_spoke"></a> [vpc\_spoke](#module\_vpc\_spoke) | ../../modules/vpc_spoke | n/a |
| <a name="module_xlb"></a> [xlb](#module\_xlb) | ../../modules/xlb | n/a |

## Resources

| Name | Type |
|------|------|
| [local_file.ssh_private_key_pem](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [tls_private_key.ssh-rsa](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [google_client_openid_userinfo.me](https://registry.terraform.io/providers/hashicorp/google/4.48.0/docs/data-sources/client_openid_userinfo) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_cidr"></a> [admin\_cidr](#input\_admin\_cidr) | value | `string` | `"0.0.0.0/0"` | no |
| <a name="input_admin_port"></a> [admin\_port](#input\_admin\_port) | value | `string` | `"8443"` | no |
| <a name="input_cluster_type"></a> [cluster\_type](#input\_cluster\_type) | Type of FortiGates cluster | `string` | `"fgcp"` | no |
| <a name="input_fgt_passive"></a> [fgt\_passive](#input\_fgt\_passive) | Deploy or not secondary FortiGate | `bool` | `true` | no |
| <a name="input_fgt_version"></a> [fgt\_version](#input\_fgt\_version) | FortiOS version | `string` | `"745"` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | value | `string` | `"payg"` | no |
| <a name="input_machine"></a> [machine](#input\_machine) | value | `string` | `"n1-standard-4"` | no |
| <a name="input_onramp"></a> [onramp](#input\_onramp) | value | `map(string)` | <pre>{<br/>  "bgp_asn": "65000",<br/>  "cidr": "172.30.0.0/23",<br/>  "id": "fgt"<br/>}</pre> | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | GCP resources prefix description | `string` | `"fgt-ha-xlb"` | no |
| <a name="input_project"></a> [project](#input\_project) | GCP project | `string` | `null` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP region to deploy | `string` | `"europe-west2"` | no |
| <a name="input_token"></a> [token](#input\_token) | GCP provider access token | `string` | `null` | no |
| <a name="input_vpc_spoke-subnet_cidrs"></a> [vpc\_spoke-subnet\_cidrs](#input\_vpc\_spoke-subnet\_cidrs) | List of CIDRs ranges to deploy VPC spokes to FortiGate HUB | `list(string)` | <pre>[<br/>  "172.30.10.0/23",<br/>  "172.30.20.0/23"<br/>]</pre> | no |
| <a name="input_zone1"></a> [zone1](#input\_zone1) | GCP region zone 1 | `string` | `"europe-west2-a"` | no |
| <a name="input_zone2"></a> [zone2](#input\_zone2) | GCP region zone 2 | `string` | `"europe-west2-b"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fgt"></a> [fgt](#output\_fgt) | n/a |
| <a name="output_vm_spoke"></a> [vm\_spoke](#output\_vm\_spoke) | n/a |
<!-- END_TF_DOCS -->

## Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.