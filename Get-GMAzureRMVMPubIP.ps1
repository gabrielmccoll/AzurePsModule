
function Get-GMAzureRMVMPubIP ($resourcegroupname,$vmname) {

$vm = get-azurermvm  -Name $vmname -ResourceGroupName $resourcegroupname 
$vmnicname = $vm.NetworkProfile.NetworkInterfaces.ID.split("/")[8]
$nic = Get-AzureRmNetworkInterface -Name $vmnicname -ResourceGroupName $resourcegroupname
$pubipname = $nic.IpConfigurations[0].PublicIpAddress.Id.split("/")[8]
Get-AzureRmPublicIpAddress -Name $pubipname -ResourceGroupName $resourcegroupname| select name,ipaddress
}
