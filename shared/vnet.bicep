 param location string
 param virtualnetworkJuanA string


 resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: '${virtualnetworkJuanA}-1'
  location: location
  properties: {    
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    subnets: [
      {
        name: '${virtualnetworkJuanA}-2'
        properties: {
          addressPrefix: '10.1.1.0/24'
        }
      }
      {
        name: '${virtualnetworkJuanA}-3'
        properties: {
          addressPrefix : '10.1.2.0/24'
        }
      }
      {
        name: '${virtualnetworkJuanA}-4'
        properties: {
          addressPrefix : '10.1.3.0/24'
        }
      }
    ]
  }
  resource subnet1  'subnets' existing = {
    name: virtualnetworkJuanA
  }

  resource subnet2 'subnets' existing = {
  name: virtualnetworkJuanA
  }
}   


 output subnet1ResourceID string = virtualNetwork::subnet1.id
 output subnet2ResourceID string = virtualNetwork::subnet2.id

