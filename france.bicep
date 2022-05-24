var location = 'francecentral'



module vnet 'shared/vnet.bicep' = {
  name: 'europe-vm'
  params: {
    location: location
    virtualnetworkJuanA: 'subred1'
  }
}

#disable-next-line ---------------------------------

module vm 'shared/vm.bicep' = {
   name: 'subneteurope1'
   params: {
     location: location
     adminUsername: 'user1'
     adminPasswordOrKey: 'P@ssw0rd'
     vmName: 'francecentral'     
   }
}
