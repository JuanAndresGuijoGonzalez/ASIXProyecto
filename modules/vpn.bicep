@secure()
param sharedKey string

@allowed([
  'Standard'
  'HighPerformance'
  'vpngw1'
  'vpngw2'
])
param gatewaySku string = 'vpngw1'

param location
