
module vnetFrance 'shared/vnet.bicep' = {
  name: 'vmFrance'
  params: {
    location: 'francecentral'
  }
}

module vmFrance 'shared/vm.bicep' = [for i in range(1,3):{ 
  name: 'antoine${i}'
  params: {
    vmName: 'vm-francecentral-${i}'
    location: 'francecentral'
    subnetId: vnetFrance.outputs.subnetId
    adminPasswordOrKey: 'P@ssw0rd12'
    adminUsername: 'marquitos'
    scriptcontent:loadTextContent('france.sh','utf-8')
  }
  
}]
