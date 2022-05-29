#!/bin/bash

# https://docs.microsoft.com/es-es/learn/modules/improve-app-scalability-resiliency-with-load-balancer/4-exercise-configure-public-load-balancer?pivots=bash
# 2 horas: vm, vnet

case $1 in

    install) 
        curl -L https://aka.ms/InstallAzureCli | bash
        az bicep install
    ;;

    login)
        az login --tenant learn.docs.microsoft.com
        az configure --defaults group=`az group list --query '[].name' --output tsv`
    ;;

    login-default)
        az login --tenant jguijoasix2nlamerce.onmicrosoft.com
        az group create --location francecentral --name test  
        az configure --defaults group='azureasix'
    ;;

    deploy)
        # https://docs.microsoft.com/en-us/cli/azure/deployment/group?view=azure-cli-latest
        az deployment group create --template-file $2
    ;;

    delete)
        az group delete --name test
        az group create --location francecentral --name test  
    ;;
    
    *)
        echo "unkown command"
    ;;
    #az bicep decompile --file azuredeploy.json

esac


