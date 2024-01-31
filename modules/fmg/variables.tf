variable "prefix" {
  description = "GCP resourcers prefix description"
  type        = string
  default     = "terraform"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "europe-west4" #Default Region
}

variable "zone" {
  description = "GCP zone"
  type        = string
  default     = "europe-west4-a" #Default Zone
}

variable "machine" {
  description = "GCP instance machine type"
  type        = string
  default     = "n1-standard-4"
}

variable "license_file" {
  description = "license file for active"
  type        = string
  default     = "./licenses/licenseFMG.lic"
}

variable "license_type" {
  description = "Provide the license type for FortiGate-VM Instances, either byol or payg."
  type        = string
  default     = "byol"
}

variable "fmg_version" {
  description = "FortiAnalyzer version"
  type        = string
  default     = "724"
}

variable "rsa-public-key" {
  description = "SSH RSA public key for KeyPair if not exists"
  type        = string
  default     = null
}

variable "gcp-user_name" {
  description = "GCP user name launch Terrafrom"
  type        = string
  default     = null
}

variable "admin_username" {
  description = "FortiAnalyzer admin username"
  type        = string
  default     = "admin"
}

variable "fmg_ni_ips" {
  description = "FortiAnalyzer IPs asignated to interfaces"
  type        = map(string)
  default     = null
}

variable "subnet_names" {
  description = "Map of subnets names where FortiAnalyzer will have an interface"
  type        = map(string)
  default     = null
}

variable "subnet_cidrs" {
  description = "Map of subnets names where FortiAnalyzer will have an interface"
  type        = map(string)
  default     = null
}

variable "public_port" {
  description = "fmg public port"
  type        = string
  default     = "port1"
}
variable "private_port" {
  description = "fmg private port"
  type        = string
  default     = "port2"
}

variable "fmg_extra-config" {
  description = "Aditional FMG bootstrap config added to module default template"
  type        = string
  default     = ""
}