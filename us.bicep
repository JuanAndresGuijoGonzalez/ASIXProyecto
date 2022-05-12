
module vnetUS 'shared/vnet.bicep' = {
  name: 'vmUs'
  params: {
    location: 'east-us'
  }
}

module vmUS 'shared/vm.bicep' = [for i in range(1,3):{ 
  name: 'ja${i}'
  params: {
    vmName: 'vm-eastus-${i}'
    location: 'east-us'
    subnetId: vnetUS.outputs.subnetId
    adminPasswordOrKey: 'P@ssw0rd12'
    adminUsername: 'juanandres'
    scriptcontent: loadTextContent('us.bicep','utf-8')
    

  }
  
}]
