var location = 'japaneast'



module vnet 'shared/vnet.bicep' = {
  name: 'asia-vn'
  params: {
    location: location
    redvirtual1: 'subred1'
    redvirtual2: 'subred2'
    redvirtual3: 'subred3'
    subredeu: 'asia-vn'
  }
}

module vm 'shared/vm.bicep' = {
  name: 'VMAsia'
  params: {
    location: location
    adminUsername: 'WeiMingXue'
    adminPasswordOrKey: 'Shanghai1'
    vmName: 'asiamachine1'
    subnetId: vnet.outputs.subnetID

  }
}

