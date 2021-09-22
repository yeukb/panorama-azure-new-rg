resource_group_name = "<RG Name>"
location = "<Azure region to deploy the VM. e.g. southeastasia>"

virtualMachineName = "panorama"

virtualMachineSize = "<Instance Size>"

# az vm image list -p paloaltonetworks -f panorama --all
# options include 10.1.0, 10.0.6
panoramaVersion = "10.1.0"

adminUsername = "paloalto"
adminPassword = "<password>"

# to add a data disk, set to true
# do not add a data disk, set to false
add_data_disk = true

