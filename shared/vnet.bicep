 param location string
 param virtualnetworkJuanA string
 param subneteeuu string
 param subnetasia string
 param subneteuropa string 


 resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: virtualnetworkJuanA
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
      ]
    }
    subnets: [
      {
        name: subneteeuu
        properties: {
          addressPrefix: '10.1.1.0/24'
        }
      }
      {
        name: subneteuropa
        properties: {
          addressPrefix : '10.1.2.0/24'
        }
      }
      {
        name: subnetasia
        properties: {
          addressPrefix : '10.1.3.0/24'
        }
      }
    ]
  }
 }   
