resource peering 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2021-08-01' = {
  name: 'peering'
  parent: 'conexion'
  properties: {
    allowForwardedTraffic: bool(1)
  }
}
