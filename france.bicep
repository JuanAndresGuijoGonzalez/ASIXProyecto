@description('Especificar un nombre para la generación de nombres')
param nombreProyecto string
var publicIPAddressName = '${nombreProyecto}-ip'
var location = 'eastasia'
var gruposeguridad = 'europensg'
var virtualmachinename = 'EuVirtualMachine'
var computername = 'Europa1'
param adminUsername string
param adminPassword string
param OSVersion string = '2019-datacenter-gensecond'



resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2020-06-01' = {
  name: publicIPAddressName
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}


#disable-next-line -------------------------------------------------------------

resource securityGroup 'Microsoft.Network/networkSecurityGroups@2021-02-01' = {
   name: gruposeguridad
   location: location
   properties: {
     securityRules: [
       {
         name: 'default'
         properties: {
           priority: 1000
           access: 'Allow'
           direction: 'Inbound'
           destinationPortRange: '3389'
           protocol: 'TCP'
           sourceAddressPrefix: '10.1.0.1/16'
         }
        }
      ]
    }
  }

#disable-next-line------------------------------------------------------------------------
  
  resource virtualmachine 'Microsoft.Compute/virtualMachines@2021-03-01' = {
    name: virtualmachinename
    location: location
    properties: {
      hardwareProfile: {
        vmSize: 'Standard_A1'
      }
      osProfile: {
        computerName: computername
        adminUsername: adminUsername
        adminPassword: adminPassword
      }
      storageProfile: {
        imageReference: {
          publisher: 'MicrosoftWindowsServer'
          offer: 'WindowsServer'
          sku: OSVersion
          version: 'latest'
        }
        osDisk: {
          createOption: 'FromImage'
          managedDisk: {
            storageAccountType: 'StandardSSD_LRS'
          }
        }
        dataDisks: [
          {
            diskSizeGB: 1023
            lun: 0
            createOption: 'Empty'
          }
        ]
      }
    }


    resource subnetEuropa2 'subnetEU' existing = {
      name:virtualmachinename
    } 
  }
  output subnetEuropa2 string = virtualmachine::subnetEuropa2.id
  


