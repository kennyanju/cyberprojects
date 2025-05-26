param vmName string = 'labVM'
param adminUsername string = 'azureuser'
@secure()
param adminPassword string
param vmSize string = 'Standard_B1s' {
  allowed: [
    'Standard_B1s'
    'Standard_B2s'
    'Standard_D2s_v3'
  ]
}
param location string = resourceGroup().location

var nicName = '${vmName}Nic'
var ipName = '${vmName}PublicIP'
var vnetName = '${vmName}VNet'
var subnetName = 'default'

resource publicIP 'Microsoft.Network/publicIPAddresses@2022-05-01' = {
  name: ipName
  location: location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2022-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: '10.0.0.0/24'
        }
      }
    ]
  }
}

resource nic 'Microsoft.Network/networkInterfaces@2022-05-01' = {
  name: nicName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        properties: {
          subnet: {
            id: vnet.properties.subnets[0].id
          }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIP.id
          }
        }
      }
    ]
  }
}

resource vm 'Microsoft.Compute/virtualMachines@2022-08-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: vmSize
    }
    osProfile: {
      computerName: vmName
      adminUsername: adminUsername
      adminPassword: adminPassword
    }
    storageProfile: {
      imageReference: {
        publisher: 'Canonical'
        offer: 'UbuntuServer'
        sku: '18.04-LTS'
        version: 'latest'
      }
      osDisk: {
        createOption: 'FromImage'
      }
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: nic.id
        }
      ]
    }
  }
}

output vmName string = vmName
output publicIP string = publicIP.properties.ipAddress
