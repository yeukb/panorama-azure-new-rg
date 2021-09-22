# Panorama in a new Azure Resource Group

This will deploy a Panorama instance in a new Azure Resource Group with the option to add a data disk.


## Prequisites
1.  Terraform v1.0 and above

2.  VM Instance Type for Panorama
    - https://docs.paloaltonetworks.com/panorama/10-1/panorama-admin/set-up-panorama/set-up-the-panorama-virtual-appliance/setup-prerequisites-for-the-panorama-virtual-appliance.html
    - https://docs.microsoft.com/en-us/azure/virtual-machines/sizes-general
    - Allowed VM Sizes are:
        - "standard_d1","standard_d1_v2","standard_d11","standard_d11_v2","standard_d12","standard_d12_v2","standard_d13","standard_d13_v2","standard_d14","standard_d14_v2","standard_d15_v2","standard_d16_v3","standard_d2","standard_d2_v2","standard_d2s_v3","standard_d3","standard_d3_v2","standard_d4","standard_d4_v2","standard_d4s_v3","standard_d5_v2","standard_d8s_v3","standard_ds1_v2","standard_ds11_v2","standard_ds11-1_v2","standard_ds12_v2","standard_ds12-1_v2","standard_ds12-2_v2","standard_ds13_v2","standard_ds13-2_v2","standard_ds13-4_v2","standard_ds14_v2","standard_ds14-4_v2","standard_ds14-8_v2","standard_ds15_v2","standard_ds2_v2","standard_ds3_v2","standard_ds4_v2","standard_ds5_v2","standard_b1ls","standard_b1ms","standard_b1s","standard_b2ms","standard_b2s","standard_f1","standard_f2","standard_f4"  



## Deployment
1. Update the "terraform.tfvars" file with the necessary information.

2. Run "terraform init"

3. Run "terraform apply"

4. Panorama will be deployed. It takes about 15-20 minutes for it to be fully ready.

5. The IP of the Panorama will be shown in the terraform outputs.


## Removing The VM
1. Run "terraform destroy"


