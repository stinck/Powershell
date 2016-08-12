Import-Module azure

# To switch to the AzureResourceManager module or to switch back to the Azure module
Switch-AzureMode -Name AzureResourceManager
Switch-AzureMode -Name AzureServiceManagement

# To connect to the tenant
Add-AzureAccount
Add-AzureAccount

Login-AzureRmAccount

Get-AzureAccount | ForEach-Object { Remove-AzureAccount $_.ID -Force }

# To select  subscription Pay-As-You-Go
Select-AzureSubscription -SubscriptionId '6df098b4-8091-463c-bf12-a58e2c5edf2a'

# To select  subscription Aviapartner Azure
Select-AzurermSubscription -SubscriptionId '37c50471-84d1-4064-bc3d-4cc4bd1d0e6d'

# To select  subscription Aviapartner Azure Development
Select-AzureSubscription -SubscriptionId '8c87b365-6cf9-4bcf-921b-111041c43045'

# To select  subscription Visual Studio Professional met MSDN
Select-AzureSubscription -SubscriptionId 'fd23e1ff-55ba-4db5-8cae-759b607a41b6'


# To get the VM's
Get-AzurermVM
Get-AzureVM

# create a context for account and key
$FSContext = New-AzureStorageContext aviapartnerusers 'cj/BbX3qW8Hpmy1vIL9uMW38z7upqGxWbiCZfTkNMnEWy7eCYctkOPbyZFFaqSM3ypiVP+AESMDrO+meHN9wrA=='

# create a new share
$FS = New-AzureStorageShare users -Context $FSContext
Get-AzureRmSubscription
# create a directory in the share
New-AzureStorageDirectory -Share $FS -Path 'admin.gijss'

cmdkey /add:aviapartnerusers.file.core.windows.net /user:prfspost /pass:cj/BbX3qW8Hpmy1vIL9uMW38z7upqGxWbiCZfTkNMnEWy7eCYctkOPbyZFFaqSM3ypiVP+AESMDrO+meHN9wrA==

net use z: \\aviapartnerusers.file.core.windows.net\users


# To get all commands of the AzureResourceManager
Get-Command -Module AzureResourceManager | Get-Help | Format-Table Name, Synopsis

Get-AzureResourceGroupGalleryTemplate -Publisher Microsoft


Get-AzureResourceGroup -Name test

Get-AzureResource -ResourceGroupName group
get-help set-azureresource
Get-AzureResource -Name test

move-azureresource -destinationresourcegroupname stinck -resourceid /subscriptions/6df098b4-8091-463c-bf12-a58e2c5edf2a/resourceGroups/Group/providers/Microsoft.ClassicCompute/domainNames/test-l4uz5fo2
$vm = Get-AzureResource -ResourceGroupName group -ResourceName test -ResourceType Microsoft.ClassicCompute/virtualMachines -Verbose
$network = Get-AzureResource -ResourceGroupName group -ResourceName test -ResourceType Microsoft.ClassicNetwork/virtualNetworks
$service = Get-AzureResource -ResourceGroupName group -ResourceName test-l4uz5fo2 -ExtensionResourceType Microsoft.ClassicCompute/domainNames
Move-AzureResource -DestinationResourceGroupName stinck -ResourceId ($vm.ResourceId,$service.ResourceId)


Get-AzureVMAvailableExtension | Format-Table -Wrap -AutoSize -Property ExtensionName, Description


#########test resource groups

New-AzureResourceGroup -Name "RG01" -Location "west europe"

New-AzureResourceGroupDeployment -Name "VMDeploy" -ResourceGroupName "CGKTSTAVP" -TemplateFile "D:\AZURE\JSON\Example.json"

Get-AzureResourceGroup -Name CGKTSTAVP


New-AzureNetworkSecurityGroup -name NSGRemoteApp -Location 'west europe' -Label 'NSG for RemoteApp' 


#get update domains
get-azurevm -ServiceName avialansso -Name svappfs02



#####EXPRESS ROUTE#########

# Review authorizations

Import-Module 'C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\Azure.psd1'
Import-Module 'C:\Program Files (x86)\Microsoft SDKs\Azure\PowerShell\ServiceManagement\Azure\ExpressRoute\ExpressRoute.psd1'

Get-AzureAuthorizedDedicatedCircuit
get-module -ListAvailable
Get-AzureDedicatedCircuit




