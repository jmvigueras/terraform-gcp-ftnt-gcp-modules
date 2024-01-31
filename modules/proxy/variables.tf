variable "prefix" {
  description = "GCP resourcers prefix description"
  type        = string
  default     = "terraform"
}

variable "region" {
  description = "GCP region to deploy"
  type        = string
  default     = "europe-west4"
}

variable "ncc_ips" {
  description = "List of NCC private IPs"
  type        = list(string)
  default     = null
}

variable "ncc_bgp-asn" {
  description = "NCC BGP ASN"
  type        = string
  default     = "65515"
}

variable "fgt_bgp-asn" {
  description = "Fortigate instances BGP ASN"
  type        = string
  default     = "65000"
}

variable "vpc_name" {
  description = "VPC name to create Cloud Router"
  type        = string
}

variable "subnet_self_link" {
  description = "Subnet SelfLink to create Cloud Router interfaces"
  type        = string
}

variable "fgt_active_self_link" {
  description = "Fortigate instance cluster member 1 SelfLink, used to create Network Appliance"
  type        = string
}

variable "fgt_passive_self_link" {
  description = "Fortigate instance cluster member 2 SelfLink, used to create Network Appliance"
  type        = string
}

variable "fgt-active-ni_ip" {
  description = "Fortigate instance cluster member 1 IP, used to create Network Appliance"
  type        = string
}

variable "fgt-passive-ni_ip" {
  description = "Fortigate instance cluster member 2 IP, used to create Network Appliance"
  type        = string
}

variable "fgt_passive" {
  description = "Boolean used to create compute router peer to fortigate instance cluster member 2"
  type        = bool
  default     = false
}
