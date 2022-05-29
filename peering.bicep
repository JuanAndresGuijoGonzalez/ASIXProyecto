@description('Lugar en el que se encuentra los recursos')
param location string = resourceGroup().location

@description(' Name para la VNET1')
param vnet1Name string = 'eu-vnet-0'

@description(' Name para la VNET1')
param vnet2Name string = 'usa-vn-0'

var Vnet1Config = {
  addressSpacePrefix: '10.1.1.0/24'
  subnetName: 'eu-vnet-1'
  subnetPrefix: '10.1.1.0/24'
}

var vnet2Config = {
  addressSpacePrefix: '10.1.1.0/24'
  subnetName: 'usa-vn-1'
  subnetPrefix: '10.1.1.0/24'
}
 
resource vnet1 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: vnet1Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        Vnet1Config.addressSpacePrefix
      ]
    }
    subnets: [
      {
        name: Vnet1Config.subnetName
        properties: {
          addressPrefix: Vnet1Config.subnetPrefix
        }
      }
    ]
  }
}

resource VnetPeering1 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  parent: vnet1
  name: '${vnet1Name}-${vnet2Name}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet2.id
    }
  }
}

resource vnet2 'Microsoft.Network/virtualNetworks@2020-05-01' = {
  name: vnet2Name
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnet2Config.addressSpacePrefix
      ]
    }
    subnets: [
      {
        name: vnet2Config.subnetName
        properties: {
          addressPrefix: vnet2Config.subnetPrefix
        }
      }
    ]
  }
}

resource vnetPeering2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2020-05-01' = {
  parent: vnet2
  name: '${vnet2Name}-${vnet1Name}'
  properties: {
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    remoteVirtualNetwork: {
      id: vnet1.id
    }
  }
}
