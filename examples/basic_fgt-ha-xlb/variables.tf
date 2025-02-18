#-----------------------------------------------------------------------------------------------------
# GCP variables
#-----------------------------------------------------------------------------------------------------
variable "project" {
  description = "GCP project"
  type        = string
  default     = null
}

variable "region" {
  description = "GCP region to deploy"
  type        = string
  default     = "europe-west2"
}

variable "zone1" {
  description = "GCP region zone 1"
  type        = string
  default     = "europe-west2-a"
}

variable "zone2" {
  description = "GCP region zone 2"
  type        = string
  default     = "europe-west2-b"
}

variable "token" {
  description = "GCP provider access token"
  type        = string
  default     = null
}

variable "prefix" {
  description = "GCP resources prefix description"
  type        = string
  default     = "fgt-ha-xlb"
}



#-----------------------------------------------------------------------------------------------------
# FGT variables
#-----------------------------------------------------------------------------------------------------
variable "license_type" {
  description = "value"
  type        = string
  default     = "payg"
}

variable "machine" {
  description = "value"
  type        = string
  default     = "n2-standard-4"
}

variable "admin_port" {
  description = "value"
  type        = string
  default     = "8443"
}

variable "admin_cidr" {
  description = "value"
  type        = string
  default     = "0.0.0.0/0"
}

variable "onramp" {
  description = "value"
  type        = map(string)
  default = {
    id      = "fgt"
    cidr    = "172.30.0.0/23"
    bgp_asn = "65000"
  }
}

variable "cluster_type" {
  description = "Type of FortiGates cluster"
  type        = string
  default     = "fgcp"
}

variable "fgt_version" {
  description = "FortiOS version"
  type        = string
  default     = "745"
}

variable "fgt_passive" {
  description = "Deploy or not secondary FortiGate"
  type        = bool
  default     = true
}