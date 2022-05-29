var location = 'australiacentral'


module vnet 'shared/vnet.bicep' = {
  name: 'europe-vnet'
  params: {
    location: location
    redvirtual1: 'subred1'
    redvirtual2: 'subred2'
    redvirtual3: 'subred3'
    subredeu: 'eu-vnet'
  }
}

module vm 'shared/vm.bicep' = {
  name: 'VMEurope'
  params: {
    location: location
    adminUsername: 'KarimBenzema'
    adminPasswordOrKey: 'Paris1'
    vmName: 'frmachine1'
    subnetId: vnet.outputs.subnetID
  }
}


