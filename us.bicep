
var location = 'eastus'
var adminpassword = 'P@ssw0rd'
var adminusername = 'usjuanandres'

resource vnetus 'Microsoft.Compute/virtualMachines@2021-11-01' = {
  name : 'eeuuvm'
  location:location
  osProfile: {
    adminPassword : adminpassword
    adminUsername : adminusername
  }

}










module vmUS 'shared/vm.bicep' = [for i in range(1,3):{ 
  name: 'ja${i}'
  params: {
    vmName: 'vm-eastus-${i}'
    location: location
    subnetId: vnetUS.outputs.subnetId
    adminPasswordOrKey: 'P@ssw0rd12'
    adminUsername: 'juanandres'
    scriptcontent: loadTextContent('us.bicep','utf-8')
    }
  }
]  
