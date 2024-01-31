# Terraform Module: FortiManager

Create a FortiManager instance wihin GCP

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_address.fmg-public-ip](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_address) | resource |
| [google_compute_disk.fmg-logdisk](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_disk) | resource |
| [google_compute_instance.fmg](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_instance) | resource |
| [random_string.randon_str](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [google_compute_image.fmg_image_byol](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_image) | data source |
| [template_file.fmg_config](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | FortiAnalyzer admin username | `string` | `"admin"` | no |
| <a name="input_fmg_extra-config"></a> [fmg\_extra-config](#input\_fmg\_extra-config) | Aditional FMG bootstrap config added to module default template | `string` | `""` | no |
| <a name="input_fmg_ni_ips"></a> [fmg\_ni\_ips](#input\_fmg\_ni\_ips) | FortiAnalyzer IPs asignated to interfaces | `map(string)` | `null` | no |
| <a name="input_fmg_version"></a> [fmg\_version](#input\_fmg\_version) | FortiAnalyzer version | `string` | `"724"` | no |
| <a name="input_gcp-user_name"></a> [gcp-user\_name](#input\_gcp-user\_name) | GCP user name launch Terrafrom | `string` | `null` | no |
| <a name="input_license_file"></a> [license\_file](#input\_license\_file) | license file for active | `string` | `"./licenses/licenseFMG.lic"` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | Provide the license type for FortiGate-VM Instances, either byol or payg. | `string` | `"byol"` | no |
| <a name="input_machine"></a> [machine](#input\_machine) | GCP instance machine type | `string` | `"n1-standard-4"` | no |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | GCP resourcers prefix description | `string` | `"terraform"` | no |
| <a name="input_private_port"></a> [private\_port](#input\_private\_port) | fmg private port | `string` | `"port2"` | no |
| <a name="input_public_port"></a> [public\_port](#input\_public\_port) | fmg public port | `string` | `"port1"` | no |
| <a name="input_region"></a> [region](#input\_region) | GCP region | `string` | `"europe-west4"` | no |
| <a name="input_rsa-public-key"></a> [rsa-public-key](#input\_rsa-public-key) | SSH RSA public key for KeyPair if not exists | `string` | `null` | no |
| <a name="input_subnet_cidrs"></a> [subnet\_cidrs](#input\_subnet\_cidrs) | Map of subnets names where FortiAnalyzer will have an interface | `map(string)` | `null` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | Map of subnets names where FortiAnalyzer will have an interface | `map(string)` | `null` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | GCP zone | `string` | `"europe-west4-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_fmg_id"></a> [fmg\_id](#output\_fmg\_id) | FortiManager instance ID |
| <a name="output_fmg_public-ip"></a> [fmg\_public-ip](#output\_fmg\_public-ip) | FortiManager public IP |
| <a name="output_fmg_self_link"></a> [fmg\_self\_link](#output\_fmg\_self\_link) | FortiManager instance SelfLink |
<!-- END_TF_DOCS -->