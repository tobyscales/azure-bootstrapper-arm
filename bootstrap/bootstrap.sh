#!/bin/bash
# additional environment variables available: $AZURE_SUBSCRIPTION_ID and $AZURE_AADTENANT_ID
echo location: $AZURE_LOCATION
echo Resourcegroup: $AZURE_RESOURCE_GROUP

az login --identity
az configure --defaults location=$AZURE_LOCATION
az configure --defaults group=$AZURE_RESOURCE_GROUP

## sample keyvault creation, using --no-self-perms since we are running under a managed identity
az keyvault create --name kv-$AZURE_RESOURCE_GROUP --enabled-for-deployment true --enabled-for-template-deployment true --no-self-perms

