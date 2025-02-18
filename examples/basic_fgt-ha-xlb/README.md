# Forigate cluster deployment
## Introduction

This deployment will create two Fortigate Clusters Active/Passive in two zones and with 3 ports (Management-HA, Public and Private)

Note: it is possible to configure mangement and HA sync port since within some interface since version 7.0.2

## Module use

### Variables

- `prefix`: Prefix to be used for resource naming
- `location`: Azure region where resources will be deployed
- `admin_cidr`: CIDR range for admin access
- `admin_username`: Administrator username for FortiGate instances
- `admin_password`: Administrator password for FortiGate instances
- `fgt_vnet_cidr`: CIDR block for the FortiGate VNet
- `license_type`: FortiGate license type (BYOL or PAYG)
- `fgt_version`: FortiGate version to deploy
- `machine`: GCP VM type for FortiGate instances
- `tags`: Map of tags to apply to resources

> [!NOTE]
> Those variables have a default value and if not provided, Azure related resources will be deployed or default values will be used. 

### Terraform code

```hcl
module "fgt-ha-xlb" {
    source = "./"

    region = "europe-west2"
    prefix = "fgt-ha-xlb"

    license_type = "payg"
    cluster_type = "fgcp"

    fgt_vnet_cidr = "172.30.0.0/23"
}
```

## Deployment Overview

- New VPCs with necessary subents: Management (MGMT), Public and Private
- Fortigate cluster: 2 instances with 3 interfaces in active-passive cluster FGCP.
- Load Balancer (LB) sandwich deployment, one LB for frontend and another for backend communications.
- HA failover is handeled by LB

## Requirements
* [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html) >= 1.0.0
* Check particulars requiriments for each deployment (GCP) 

## Support
This a personal repository with goal of testing and demo Fortinet solutions on the Cloud. No support is provided and must be used by your own responsability. Cloud Providers will charge for this deployments, please take it in count before proceed.

