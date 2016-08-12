
Install-Module azurerm
#test
Install-AzureRM

Import-AzureRM

Import-Module AzureRM.Network 
Login-AzureRmAccount
Get-AzureRmSubscription
Select-AzureRmSubscription -SubscriptionId "37c50471-84d1-4064-bc3d-4cc4bd1d0e6d"
Get-AzureRmExpressRouteCircuit

Select-AzureRmSubscription -SubscriptionId "51441d9d-e193-4cd0-827d-42b1a78680e1"

get-azurededicatedcircuit

Get-AzureRmVM

Restart-AzureRmVM -Name "AVP-PRD-VM-FS01" 

get-AzureRmSubscription
Select-AzureRmSubscription -SubscriptionId "51441d9d-e193-4cd0-827d-42b1a78680e1"


$circuit = Get-AzureRmExpressRouteCircuit -Name "AVP2Azure" -ResourceGroupName "AVP-PRD-RG-VNET01"
$gw = Get-AzureRmVirtualNetworkGateway -Name "AVP-PRD-GW-ER" -ResourceGroupName "AVP-PRD-RG-VNET01"
$connection = New-AzureRmVirtualNetworkGatewayConnection -Name "AVP-PRD-GW-CN" -ResourceGroupName "AVP-PRD-RG-VNET01" -Location "West Europe" -VirtualNetworkGateway1 $gw -PeerId $circuit.Id -ConnectionType ExpressRoute

Remove-AzureRmVirtualNetworkGatewayConnection -Name "AVP-PRD-GW-CN" -ResourceGroupName "AVP-PRD-RG-VNET01" -Force

get-AzureRmVirtualNetworkGatewayConnection -Name "AVP-PRD-GW-CN" -ResourceGroupName "AVP-PRD-RG-VNET01"

get-AzureRmVirtualNetworkGatewayConnection -Name "ConPOCExpressroute" -ResourceGroupName "PocExpressroute"

$gw.EnableBgp

Get-AzureExpressRouteServiceProvider

Get-AzureRmExpressRouteServiceProvider

$resourcegroup = 'AVP-PRD-RG-VNET01'

New-AzureRmExpressRouteCircuit -Name "AVP2Azure" -ResourceGroupName $resourcegroup -Location "West Europe" -SkuTier Standard -SkuFamily MeteredData -ServiceProviderName "Colt IPVPN" -PeeringLocation "Silicon Valley" -BandwidthInMbps 200




Get-AzureRmExpressRouteCircuitPeeringConfig -Circuit $circuit

#create Peering Config
 
$peeringconfig = New-AzureRmExpressRouteCircuitPeeringConfig -Name "AzurePrivatePeering" -PeeringType AzurePrivatePeering `
 -PrimaryPeerAddressPrefix "172.22.5.104/30" `
 -SecondaryPeerAddressPrefix "172.22.4.72/30" `
 -VlanId "172"



Add-AzureRmExpressRouteCircuitPeeringConfig -Name "AzurePrivatePeering" -Circuit $circuit -PeeringType AzurePrivatePeering -PrimaryPeerAddressPrefix "172.22.5.104/30" -SecondaryPeerAddressPrefix "172.22.4.72/30" -VlanId 172
Set-AzureRmExpressRouteCircuit -ExpressRouteCircuit $circuit


Set-AzureRmExpressRouteCircuitPeeringConfig -Name "AzurePrivatePeering" -Circuit $circuit -PeeringType AzurePrivatePeering -PeerASN 8220 -PrimaryPeerAddressPrefix "172.22.5.104/30" -SecondaryPeerAddressPrefix "172.22.4.72/30" -VlanId 172
Set-AzureRmExpressRouteCircuit -ExpressRouteCircuit $circuit


Set-AzureRmExpressRouteCircuitPeeringConfig -Name "AzurePrivatePeering" -Circuit $ckt -PeeringType AzurePrivatePeering -PeerASN 100 -PrimaryPeerAddressPrefix "10.0.0.0/30" -SecondaryPeerAddressPrefix "10.0.0.4/30" -VlanId 200
Set-AzureRmExpressRouteCircuit -ExpressRouteCircuit $ckt




 #create gateway connection
$circuit = Get-AzureRmExpressRouteCircuit -Name 'expressroutecircuit' -ResourceGroupName 'rg'
$vnetgateway = Get-AzureRmVirtualNetworkGateway -Name "vnetgw" -ResourceGroupName 'rg'
 
New-AzureRmVirtualNetworkGatewayConnection -ConnectionType ExpressRoute -Location "West Europe" `
 -Name "expressrouteconnection" `
 -ResourceGroupName "rg" `
 -VirtualNetworkGateway1 $vnetgateway `
 -PeerId $circuit.Id


Get-AzureRmExpressRouteCircuitPeeringConfig





Get-AzureRmVirtualNetworkGatewayConnection -Name 'AVP-PRD-GW-CN' -ResourceGroupName 'AVP-PRD-RG-VNET01'
Remove-AzureRmVirtualNetworkGatewayConnection -name 'AVP-PRD-GW-CN' -ResourceGroupName 'AVP-PRD-RG-VNET01'
# create a new gateway
 $circuit = Get-AzureRmExpressRouteCircuit -Name "AVP2Azure" -ResourceGroupName "AVP-PRD-RG-VNET01"
 $gw = Get-AzureRmVirtualNetworkGateway -Name "AVP-PRD-GW-ER" -ResourceGroupName "AVP-PRD-RG-VNET01"
 New-AzureRmVirtualNetworkGatewayConnection -ConnectionType ExpressRoute -Location "West Europe" -Name "AVP-PRD-GW-CN" -ResourceGroupName "AVP-PRD-RG-VNET01" -VirtualNetworkGateway1 $gw -PeerId $circuit.Id

 Get-AzureRmExpressRouteServiceProvider


 #--------------------------------------------------------
 
$Vnet = Get-AzureRmVirtualNetwork -Name VNetPOC -ResourceGroupName POCExpressRoute

$gwSubnet = Get-AzureRmVirtualNetworkSubnetConfig -Name "GatewaySubnet" -VirtualNetwork $vnet
$gwIP = New-AzureRmPublicIpAddress -Name "VPNGatewayIP" -ResourceGroupName POCExpressRoute -Location "West Europe" -AllocationMethod Dynamic
$gwConfig = New-AzureRmVirtualNetworkGatewayIpConfig -Name "VPNGatewayIpConfig" -SubnetId $gwSubnet.Id -PublicIpAddressId $gwIP.Id
New-AzureRmVirtualNetworkGateway -Name "VPNGateway" -ResourceGroupName POCExpressRoute -Location "West Europe" -IpConfigurations $gwConfig -GatewayType "Vpn" -VpnType "RouteBased" -GatewaySku "Standard"

$MyLocalNetworkAddress = @("172.22.24.0/24","172.22.25.0/24") 

$localVpn = New-AzureRmLocalNetworkGateway -Name "LocalVPNGateway" -ResourceGroupName POCExpressRoute -Location "West Europe" -GatewayIpAddress *<Public IP>* -AddressPrefix $MyLocalNetworkAddress

$azureVpn = Get-AzureRmVirtualNetworkGateway -Name "VPNGateway" -ResourceGroupName POCExpressRoute
New-AzureRmVirtualNetworkGatewayConnection -Name "VPNConnection" -ResourceGroupName POCExpressRoute -Location "West Europe" -VirtualNetworkGateway1 $azureVpn -LocalNetworkGateway2 $localVpn -ConnectionType IPsec -SharedKey ""


#-----------------------------------------------------------

$circuit = Get-AzureRmExpressRouteCircuit -Name "AVP2Azure" -ResourceGroupName "AVP-PRD-RG-VNET01"
Add-AzureRmExpressRouteCircuitAuthorization -ExpressRouteCircuit $circuit -Name "AuthAviapartnerTestADFS"
Set-AzureRmExpressRouteCircuit -ExpressRouteCircuit $circuit

$AuthAviapartnerTestADFS = Get-AzureRmExpressRouteCircuitAuthorization -ExpressRouteCircuit $circuit -Name "AuthAviapartnerTestADFS"


Remove-AzureRmExpressRouteCircuitAuthorization -Name "AuthAviapartnerTestADFS" -ExpressRouteCircuit $circuit
Set-AzureRmExpressRouteCircuit -ExpressRouteCircuit $circuit    
