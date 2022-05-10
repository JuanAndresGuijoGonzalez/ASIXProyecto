
module Asia 'modules/vnet.bicep' = {
  name: 'ja'
  params: {
    location: 'eastasia'
  }
}

module vm 'modules/vm.bicep' = [for i in range(1,3):{ 
  name: 'ja${i}'
  params: {
    location: 'eastasia'
    subnetId: Asia.outputs.subnetId
    adminPasswordOrKey: 'P@ssw0rd12'
    adminUsername: 'juanandres'
  }
  
}]