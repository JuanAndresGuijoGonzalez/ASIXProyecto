module vnetTest 'vnet.bicep' = {
  name: 'shared-vnet-test'
  params: {
    location: 'francecentral'
    virtualnetworkJuanA: 'vnet-test'
  }
}
