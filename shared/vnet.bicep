 param location string
 param redvirtual1 string
 param redvirtual2 string
 param redvirtual3 string
 param subredeu string


 resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-08-01' = {
  name: '${subredeu}-0'
  location: location
  properties: {    
    addressSpace: {
      addressPrefixes: [
        '10.1.0.0/16'
        '10.2.0.0/16'
        '10.3.0.0/16'
      ]
    }
    subnets: [
      {
        name: '${subredeu}-1'
        properties: {
          addressPrefix: '10.1.1.0/24'
        }
      }
      {
        name: '${subredeu}-2'
        properties: {
          addressPrefix : '10.1.2.0/24'
        }
      }
      {
        name: '${subredeu}-3'
        properties: {
          addressPrefix : '10.1.3.0/24'
        }
      }
    ]
  }
  resource subnet1  'subnets' existing = {
    name: redvirtual1
  }

  resource subnet2 'subnets' existing = {
  name: redvirtual2
  }
  resource subnet3 'subnets' existing = {
    name: redvirtual3
  }
}   


 output subnet1ResourceID string = virtualNetwork::subnet1.id
 output subnet2ResourceID string = virtualNetwork::subnet2.id
 output subnet3ResourceID string = virtualNetwork::subnet3.id
 output subnetID string = virtualNetwork.properties.subnets[0].id

