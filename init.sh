#!/bin/bash

az login --tenant learn.docs.microsoft.com
az configure --defaults group=`az group list --query '[].name' --output tsv`

# az deployment group create --template-file global.bicep