# Terraform Module: Create Proxy (BETA)

Create a proxy (https) wihin GCP

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_backend_service.bck-end-srv_net-endpoint](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_backend_service) | resource |
| [google_compute_global_address.elb_frontend_pip_2](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_address) | resource |
| [google_compute_global_forwarding_rule.elb_fwd-rule_http](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_global_forwarding_rule.elb_fwd-rule_https](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_global_forwarding_rule) | resource |
| [google_compute_health_check.bck-end-srv_health-check](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_health_check) | resource |
| [google_compute_network_endpoint.net-endpoint_spoke_http](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_endpoint) | resource |
| [google_compute_network_endpoint_group.net-endpoint_group](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network_endpoint_group) | resource |
| [google_compute_ssl_certificate.elb_https_cert](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_ssl_certificate) | resource |
| [google_compute_target_http_proxy.elb_http_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_http_proxy) | resource |
| [google_compute_target_https_proxy.elb_https_proxy](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_target_https_proxy) | resource |
| [google_compute_url_map.elb_https_l7](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_url_map) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fgt-active-ni_ip"></a> [fgt-active-ni\_ip](#input\_fgt-active-ni\_ip) | Fortigate instance cluster member 1 IP, used to create Network Appliance | `string` | n/a | yes |
| <a name="input_fgt-passive-ni_ip"></a> [fgt-passive-ni\_ip](#input\_fgt-passive-ni\_ip) | Fortigate instance cluster member 2 IP, used to create Network Appliance | `string` | n/a | yes |
| <a name="input_fgt_active_self_link"></a> [fgt\_active\_self\_link](#input\_fgt\_active\_self\_link) | Fortigate instance cluster member 1 SelfLink, used to create Network Appliance | `string` | n/a | yes |
| <a name="input_fgt_bgp-asn"></a> [fgt\_bgp-asn](#input\_fgt\_bgp-asn) | Fortigate instances BGP ASN | `string` | `"65000"` | no |
| <a name="input_fgt_passive"></a> [fgt\_passive](#input\_fgt\_passive) | Boolean used to create compute router peer to fortigate instance cluster member 2 | `bool` | `false` | no |
| <a name="input_fgt_passive_self_link"></a> [fgt\_passive\_self\_link](#input\_fgt\_passive\_self\_link) | Fortigate instance cluster member 2 SelfLink, used to create Network Appliance | `string` | n/a | yes |
| <a name="input_ncc_bgp-asn"></a> [ncc\_bgp-asn](#input\_ncc\_bgp-asn) | NCC BGP ASN | `string` | `"65515"` | no |
| <a name="input_ncc_ips"></a> [ncc\_ips](#input\_ncc\_ips) | List of NCC private IPs | `list(string)` | `null` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | GCP resourcers prefix description | `string` | `"terraform"` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP region to deploy | `string` | `"europe-west4"` | no |
| <a name="input_subnet_self_link"></a> [subnet\_self\_link](#input\_subnet\_self\_link) | Subnet SelfLink to create Cloud Router interfaces | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name to create Cloud Router | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->