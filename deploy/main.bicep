@description('euwest')
param appServiceAppName string = 'toyweb-${uniqueString(resourceGroup().id)}'

@description('The name of the Cosmos DB account. This name must be globally unique.')
param cosmosDBAccountName string = 'toyweb-${uniqueString(resourceGroup().id)}'

param location string = resourceGroup().location

module appService 'modules/app-service.bicep' = {
   name: 'app-Service'
   params:{
     location: location
     environmentType: environmentType
     appServiceAppName: appServiceAppName
   } 
}
module cosmosDB 'modules/cosmos-db.bicep' = {
  name: 'cosmos-db'
  params: {
    location: location
    environmentType: environmentType
    cosmosDBAccountName: cosmosDBAccountName
  }
}
@description('')
@allowed([
 'nonprod'
 'prod'
])
param environmentType string

