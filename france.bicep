
module vnet 'modules/vnet.bicep' = {
  name: 'vmFrance'
  params: {
    location: 'francecentral'
  }
}

module vm 'modules/vm.bicep' = [for i in range(1,3):{ 
  name: 'ja${i}'
  params: {
    location: 'francecentral'
    subnetId: vnet.outputs.subnetId
    adminPasswordOrKey: 'P@ssw0rd12'
    adminUsername: 'juanandres'
  }
  
}]
