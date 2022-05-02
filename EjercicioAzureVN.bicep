resource  VnetAsia  'Microsoft.Network/VirtualNetworks@2019-09-01' = {
  name: 'ow-vnet1'
  location: location
  tags: {
      env: 'dev'
  }
  properties: {
      addressSpace: {
          addressPrefixes: [
              '10.0.0.0/16'
          ]
      }
      subnets: [
          {
              name: 'public-subnet'
              properties: {
                  addressPrefix: '10.0.1.0/24'
              }
          }  
      ]  
  } 
}

resource VirtualMarchineAsia 'Microsoft.Compute/virtualMachines@2020-06-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
      }
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: ubuntuOSVersion
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic1.id
        }
      ]
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPasswordOrKey
      linuxConfiguration: ((authenticationType == 'password') ? null : linuxConfiguration)
    }
  }
}


@description('The name of you Virtual Machine.')
param vmName string = 'simpleLinuxVM'

@description('Username for the Virtual Machine.')
param adminUsername string

param subnetId string

@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
@allowed([
  'sshPublicKey'
  'password'
])
param authenticationType string = 'password'

@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param adminPasswordOrKey string

@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsLabelPrefix string = toLower('simplelinuxvm-${uniqueString(resourceGroup().id)}')

@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version.')
@allowed([
  '12.04.5-LTS'
  '14.04.5-LTS'
  '16.04.0-LTS'
  '18.04-LTS'
])
param ubuntuOSVersion string = '18.04-LTS'

@description('Location for all resources.')
param location string

@description('The size of the VM')
param vmSize string = 'Standard_B2s'



@description('Name of the Network Security Group')
param networkSecurityGroupName string = 'SecGroupNet'

var publicIPAddressName = '${vmName}PublicIP'
var networkInterfaceName = '${vmName}NetInt'
var osDiskType = 'Standard_LRS'
var linuxConfiguration = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: adminPasswordOrKey
      }
    ]
  }
}

resource nic1 'Microsoft.Network/networkInterfaces@2020-06-01' = {
  name: networkInterfaceName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetId
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAsia.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsgAsia.id
    }
  }
}

resource nsgAsia 'Microsoft.Network/networkSecurityGroups@2020-06-01' = {
  name: networkSecurityGroupName
  location: location
  properties: {
    securityRules: [
      {
        name: 'SSH'
        properties: {
          priority: 1000
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
  }
}



resource publicIPAsia 'Microsoft.Network/publicIPAddresses@2020-06-01' = {
  name: publicIPAddressName
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: dnsLabelPrefix
    }
    idleTimeoutInMinutes: 4
  }
}









resource  VnetEurope  'Microsoft.Network/VirtualNetworks@2019-09-01' = {
  name: 'ow-vnet2'
  location: location
  tags: {
      env: 'dev'
  }
  properties: {
      addressSpace: {
          addressPrefixes: [
              '10.0.0.1/16'
          ]
      }
      subnets: [
          {
              name: 'public-subnet'
              properties: {
                  addressPrefix: '10.0.2.0/24'
              }
          }  
      ]  
  } 
}

resource VirtualEurope 'Microsoft.Compute/virtualMachines@2020-06-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize2
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType2
        }
      }
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: ubuntuOSVersionMachine2
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic2.id
        }
      ]
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPasswordOrKey
      linuxConfiguration: ((authenticationType2 == 'password') ? null : LinuxConfiguration2)
    }
  }
}

@description('The name of the Second Virtual Machine')
param vmName2 string = 'simpleLinuxVM'

@description('Username of the Second Virtual Machine')
param adminUsername2 string

param subnetId2 string

@description('Type of authentication to use on the Second Virtual Machine . SSH Key is recommended')
@allowed([
  'sshPublicKey'
  'password'

])
param authenticationType2 string = 'password'
@description('SSH Key or password for the Second Virtual Machine. SSH Key is recommended.')
@secure()
param adminPasswordOrKey2 string

@description('Unique DNS Name for the Public IP used to access to the Second  Virtual Machine.')
param dnsLabelPrefix2 string = toLower('simplelinuxvm-${uniqueString(resourceGroup().id)}')

@description('The Ubuntu version for the Second VM. This will pick a fully patched image of this given Ubuntu version.')
@allowed([
  '12.04.5-LTS'
  '14.04.5-LTS'
  '16.04.0-LTS'
  '18.04-LTS'
])
param ubuntuOSVersionMachine2 string = '18.04-LTS'

@description('Location for all resources.')
param location2 string

@description('The Size of the Second Virtual Machine')
param vmSize2 string = 'Standard_B2s'

@description('Name of the Second Network Security Group')
param networkSecurityGroupName2 string = 'SecGroupNet'

var publicIPAddressName2 = '${vmName2}PublicIP'
var networkInterfaceName2 = '${vmName2}NetInt'
var osDiskType2 = 'Standard_LRS'
var LinuxConfiguration2 = {
  disablePasswordAuthentication: true 
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername2}/.ssh/authorized_keys'
        keyData: adminPasswordOrKey2
      }
    ]
  }
}
resource nic2 'Microsoft.Network/networkInterfaces@2020-06-01' = {
  name: networkInterfaceName2
  location: location2
  properties: {
    ipConfigurations: [
      {
        name: 'IpConfig2'
        properties: {
          subnet: {
            id : subnetId2
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPEurope.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsgEurope.id
    }
  }
}

resource nsgEurope 'Microsoft.Network/networkSecurityGroups@2020-06-01' = {
  name: networkSecurityGroupName2
  location: location
  properties: {
    securityRules: [
      {
        name: 'SSH'
        properties: {
        priority: 1000
        protocol: 'Tcp'
        access: 'Allow'
        direction: 'Inbound'
        sourceAddressPrefix: '*'
        sourcePortRange: '*'
        destinationAddressPrefix: '*'
        destinationPortRange: '22'
        }
      }
    ]
  }
}

resource publicIPEurope 'Microsoft.Network/publicIPAddresses@2020-06-01' = {
  name: publicIPAddressName2
  location: location2
  sku: {
    name : 'Basic'
  }
  properties : {
    publicIPAllocationMethod: 'Dynamic'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: dnsLabelPrefix2
    }
    idleTimeoutInMinutes: 4
  }
}



resource  VnetNorthAmerica  'Microsoft.Network/VirtualNetworks@2019-09-01' = {
  name: 'ow-vnet3'
  location: location
  tags: {
      env: 'dev'
  }
  properties: {
      addressSpace: {
          addressPrefixes: [
              '10.0.0.0/16'
          ]
      }
      subnets: [
          {
              name: 'public-subnet'
              properties: {
                  addressPrefix: '10.0.1.0/24'
              }
          }  
      ]  
  } 
}

resource VirtualMachineNorthAmerica 'Microsoft.Compute/virtualMachines@2020-06-01' = {
  name:vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize3
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType3
        }
      }
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: ubuntuOSVersionMachine3
        version: 'latest'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic3.id
        }
      ]
    }
    osProfile: {
      computerName: vmName3
      adminUsername: adminUsername3
      adminPassword: adminPasswordOrKey3
      linuxConfiguration: ((authenticationType3 == 'password')? null: linuxConfiguration3)
    }
  }
}

@description('The name of you Virtual Machine.')
param vmName3 string = 'simpleLinuxVM'

@description('Username for the Virtual Machine.')
param adminUsername3 string

param subnetId3 string

@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
@allowed([
  'sshPublicKey'
  'password'
])
param authenticationType3 string = 'password'

@description('SSH Key or password for the Virtual Machine. SSH key is recommended.')
@secure()
param adminPasswordOrKey3 string

@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsLabelPrefix3 string = toLower('simplelinuxvm-${uniqueString(resourceGroup().id)}')

@description('The Ubuntu version for the VM. This will pick a fully patched image of this given Ubuntu version.')
@allowed([
  '12.04.5-LTS'
  '14.04.5-LTS'
  '16.04.0-LTS'
  '18.04-LTS'
])
param ubuntuOSVersionMachine3 string = '18.04-LTS'

@description('Location for all resources.')
param location3 string

@description('The size of the VM')
param vmSize3 string = 'Standard_B2s'



@description('Name of the Network Security Group')
param networkSecurityGroupName3 string = 'SecGroupNet'

var publicIPAddressName3 = '${vmName3}PublicIP'
var networkInterfaceName3 = '${vmName3}NetInt'
var osDiskType3 = 'Standard_LRS'
var linuxConfiguration3 = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: adminPasswordOrKey
      }
    ]
  }
}

resource nic3 'Microsoft.Network/networkInterfaces@2020-06-01' = {
  name: networkInterfaceName3
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: subnetId3
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPNorthAmerica.id
          }
        }
      }
    ]
    networkSecurityGroup: {
      id: nsgNorthAmerica.id
    }
  }
}

resource nsgNorthAmerica 'Microsoft.Network/networkSecurityGroups@2020-06-01' = {
  name: networkSecurityGroupName3
  location: location3
  properties: {
    securityRules: [
      {
        name: 'SSH'
        properties: {
          priority: 1000
          protocol: 'Tcp'
          access: 'Allow'
          direction: 'Inbound'
          sourceAddressPrefix: '*'
          sourcePortRange: '*'
          destinationAddressPrefix: '*'
          destinationPortRange: '22'
        }
      }
    ]
  }
}



resource publicIPNorthAmerica 'Microsoft.Network/publicIPAddresses@2020-06-01' = {
  name: publicIPAddressName3
  location: location
  sku: {
    name: 'Basic'
  }
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: dnsLabelPrefix3
    }
    idleTimeoutInMinutes: 4
  }
}






