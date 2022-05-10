
module vnet 'shared/vnet.bicep' = {
  name: 'vmUs'
  params: {
    location: 'east-us'
  }
}

module vm 'shared/vm.bicep' = [for i in range(1,3):{ 
  name: 'ja${i}'
  params: {
    location: 'east-us'
    subnetId: vnet.outputs.subnetId
    adminPasswordOrKey: 'P@ssw0rd12'
    adminUsername: 'juanandres'
  }
  
}]
