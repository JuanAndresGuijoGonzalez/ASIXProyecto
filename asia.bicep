
module vnetAsia 'shared/vnet.bicep' = {
  name: 'ja'
  params: {
    location: 'eastasia'
  }
}



module vm 'shared/vm.bicep' = [for i in range(1,3):{ 
  name: 'mery${i}'
  params:{
    vmName: 'veastasia-mery${i}'
    location: 'eastasia'
    subnetId: vnetAsia.outputs.subnetId
    adminPasswordOrKey: 'P@ssw0rd12'
    adminUsername: 'maria'
    scriptcontent: loadTextContent('asia.sh','utf-8')
  }
  
  
}]
