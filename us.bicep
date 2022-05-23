var location = 'eastasia'
var virtualmachinename = 'NAVirtualMachine'
var computername = 'NorthAmerica1'
param adminUsername string
param adminPassword string
param OSVersion string = '2019-datacenter-gensecond'




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
  }
