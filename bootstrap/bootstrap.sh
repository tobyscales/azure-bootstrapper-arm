#!/bin/bash
# additional environment variables available: $AZURE_SUBSCRIPTION_ID, $AZURE_AADTENANT_ID and $AZURE_KEYVAULT
echo location: $AZURE_LOCATION
echo Resourcegroup: $AZURE_RESOURCE_GROUP

az login --identity
az configure --defaults location=$AZURE_LOCATION
az configure --defaults group=$AZURE_RESOURCE_GROUP

## sample keyvault secret set/get operations
az keyvault secret set --vault-name $AZURE_KEYVAULT --name "mySecret" --value "mySecretValue"  > secret.json
jq -r '"secretUrl: \(.id)"' secret.json

az keyvault secret show --vault-name $AZURE_KEYVAULT --name "mySecret" > value.json
jq -r '"secretValue: \(.value)"' value.json

## uncomment the below statement to troubleshoot your startup script interactively in ACI (Connect tab)
#tail -f /dev/null