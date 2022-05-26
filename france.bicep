var location = 'australiacentral'



module vnet 'shared/vnet.bicep' = {
  name: 'europe-vm'
  params: {
    location: location
    redvirtual1: 'subred1'
    redvirtual2: 'subred2'
    redvirtual3: 'subred3'
    subredeu: 'Australia'
  }
}

#disable-next-line ---------------------------------

module vm 'shared/vm.bicep' = {
   name: 'subneteurope1'
   params: {
     location: location
     adminUsername: 'user1'
     adminPasswordOrKey: 'P@ssw0rd'
     vmName: 'australiaeast'
     subnetId: vnet.outputs.subnetID
   }
}
