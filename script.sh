#!/bin/bash

az login --tenant learn.docs.microsoft.com
az configure --defaults group=`az group list --query '[].name' --output tsv`

# az deployment group create --template-file global.bicep
https://docs.microsoft.com/es-es/learn/modules/improve-app-scalability-resiliency-with-load-balancer/4-exercise-configure-public-load-balancer?pivots=bash