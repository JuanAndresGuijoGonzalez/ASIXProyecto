var location = 'australiacentral'




module vnet 'shared/vnet.bicep' = {
  name: 'usa-vnet'
  params: {
    location: location
    redvirtual1: 'subred1'
    redvirtual2: 'subred2'
    redvirtual3: 'subred3'
    subredeu: 'usa-vn'
  }
}


module vm 'shared/vm.bicep' = {
  name: 'VMUsa'
  params: {
    location: location
    adminUsername: 'TomCruise'
    adminPasswordOrKey: 'NewYork1'
    vmName: 'usamachine1'
    subnetId: vnet.outputs.subnetID
  }
}



