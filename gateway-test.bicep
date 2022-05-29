resource gateway 'Microsoft.Network/virtualNetworkGateways@2021-08-01' = {
  name: 'vpn1'
  location: ''
  properties: {
    activeActive: bool(1)
    bgpSettings: {
      asn: int(1)
    }
    enableBgp: bool(1)
  }
}
