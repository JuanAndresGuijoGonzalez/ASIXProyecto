 param location string
 param virtualnetworkJuanA string
 


 resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: '${virtualnetworkJuanA}-1'
  location: '${location}-1'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    subnets: [
      {
        name: '${virtualnetworkJuanA}-1'
        properties: {
          addressPrefix: '10.1.1.0/24'
        }
      }
      {
        name: '${virtualnetworkJuanA}-2'
        properties: {
          addressPrefix : '10.1.2.0/24'
        }
      }
      {
        name: '${virtualnetworkJuanA}-3'
        properties: {
          addressPrefix : '10.1.3.0/24'
        }
      }
    ]
  }
 }   
