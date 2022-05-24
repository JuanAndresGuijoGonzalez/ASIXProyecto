var location = 'australiacentral'



module vnet 'shared/vnet.bicep' = {
  name: 'europe-vm'
  params: {
    location: location
    virtualnetworkJuanA: 'subred1'
  }
}

module vm 'shared/vm.bicep' = {
  name: 'juanandres'
  params: {
    location: location 
    adminUsername: 'juanandres'
    adminPasswordOrKey: 'P@ssw0rd'
    vmName: 'europejuanandres1'
    subnetId:
  }
}
