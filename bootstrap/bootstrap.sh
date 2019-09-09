#!/bin/bash
echo location: $AZURE_LOCATION
echo Resourcegroup: $AZURE_RESOURCE_GROUP

az login --identity
az configure --defaults location=$AZURE_LOCATION
az configure --defaults group=$AZURE_RESOURCE_GROUP

## sample creation
az keyvault create --name kv-$AZURE_RESOURCE_GROUP --enabled-for-deployment true --enabled-for-template-deployment true 
