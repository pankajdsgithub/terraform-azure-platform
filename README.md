# Naming convention explained
Resource	Naming pattern	Example
Resource Group	JSR-<nnn>-Azure-INT-RG-<Workload>	JSR-001-Azure-INT-RG-Hub
Virtual Network	JSR-<nnn>-Azure-INT-VNet-<Workload>	JSR-001-Azure-INT-VNet-Hub
Subnet	snet-<workload>-<purpose>	snet-app-workload

Important enterprise considerations
- INT assumes this is for an internal enterprise workload. Use CLT if the resources are client-specific.
- I have standardized both VNets to Central India to align with your previously discussed enterprise Azure deployment region. Change it if your dev environment has a different approved region.
- Subnets use descriptive names rather than the full naming pattern because subnet names have Azure-specific restrictions, and shorter names are generally easier to manage.
- Resource identifiers such as rg1, rg2, vnet1, and vnet2 remain unchanged. This avoids breaking Terraform references.