@description('Name for vNet 1')
param vnet1Name string = 'vNet1'

@description('Name for vNet 2')
param vnet2Name string = 'vNet2'

param nameid string
resource id 'Microsoft.ServiceBus/namespaces@2017-04-01' existing = {
  id : asia.id
}


resource vnetPeering1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
parent: vnet1Name
name: '${vnet1Name}-${vnet2Name}'
properties: {
  allowVirtualNetworkAccess: true
  allowForwardedT2raffic: false
  allowGatewayTransit: false
  useRemoteGateways: false
  remoteVirtualNetwork: {
    id: asia.id
  }
 }
}
