#------------------------------------------------------------------------------------------------------------
# Create VPCs and subnets Fortigate
# - VPC for MGMT and HA interface
# - VPC for Public interface
# - VPC for Private interface  
#------------------------------------------------------------------------------------------------------------
module "fgt_vpc" {
  source = "../../modules/vpc_fgt"

  region = var.region
  prefix = var.prefix

  vpc-sec_cidr = var.onramp["cidr"]
}
#------------------------------------------------------------------------------------------------------------
# Create FGT cluster config
#------------------------------------------------------------------------------------------------------------
module "fgt_config" {
  source = "../../modules/fgt_config"

  admin_cidr     = var.admin_cidr
  admin_port     = var.admin_port
  rsa-public-key = trimspace(tls_private_key.ssh-rsa.public_key_openssh)

  subnet_cidrs       = module.fgt_vpc.subnet_cidrs
  fgt-active-ni_ips  = module.fgt_vpc.fgt-active-ni_ips
  fgt-passive-ni_ips = module.fgt_vpc.fgt-passive-ni_ips

  config_fgcp  = var.cluster_type == "fgcp" ? true : false
  config_fgsp  = var.cluster_type == "fgsp" ? true : false
  config_spoke = true
  config_xlb   = true
  spoke        = var.onramp
  ilb_ip       = module.fgt_vpc.ilb_ip

  vpc-spoke_cidr = [module.fgt_vpc.subnet_cidrs["bastion"]]
}
#------------------------------------------------------------------------------------------------------------
# Create FGT cluster instances
#------------------------------------------------------------------------------------------------------------
module "fgt" {
  source = "../../modules/fgt_ha"

  prefix = var.prefix
  region = var.region
  zone1  = var.zone1
  zone2  = var.zone2

  machine        = var.machine
  rsa-public-key = trimspace(tls_private_key.ssh-rsa.public_key_openssh)
  gcp-user_name  = split("@", data.google_client_openid_userinfo.me.email)[0]
  license_type   = var.license_type

  subnet_names       = module.fgt_vpc.subnet_names
  fgt-active-ni_ips  = module.fgt_vpc.fgt-active-ni_ips
  fgt-passive-ni_ips = module.fgt_vpc.fgt-passive-ni_ips

  fgt_config_1 = module.fgt_config.fgt_config_1
  fgt_config_2 = module.fgt_config.fgt_config_2

  config_fgsp = var.cluster_type == "fgsp" ? true : false

  fgt_passive = var.fgt_passive
  fgt_version = var.fgt_version
}
#------------------------------------------------------------------------------------------------------------
# Create Internal and External Load Balancer
#------------------------------------------------------------------------------------------------------------
module "xlb" {
  source = "../../modules/xlb"

  prefix = var.prefix
  region = var.region
  zone1  = var.zone1
  zone2  = var.zone2

  vpc_names             = module.fgt_vpc.vpc_names
  subnet_names          = module.fgt_vpc.subnet_names
  ilb_ip                = module.fgt_vpc.ilb_ip
  fgt_active_self_link  = module.fgt.fgt_active_self_link
  fgt_passive_self_link = module.fgt.fgt_passive_self_link[0]
}




#------------------------------------------------------------------------------------------------------------
# Necessary variables
#------------------------------------------------------------------------------------------------------------
data "google_client_openid_userinfo" "me" {}

resource "tls_private_key" "ssh-rsa" {
  algorithm = "RSA"
}

resource "local_file" "ssh_private_key_pem" {
  content         = tls_private_key.ssh-rsa.private_key_pem
  filename        = ".ssh/ssh-key.pem"
  file_permission = "0600"
}