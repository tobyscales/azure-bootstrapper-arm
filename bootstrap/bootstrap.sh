#!/bin/bash
# additional environment variables available: $AZURE_SUBSCRIPTION_ID, $AZURE_AADTENANT_ID and $AZURE_KEYVAULT
echo location: $AZURE_LOCATION
echo Resourcegroup: $AZURE_RESOURCE_GROUP

az login --identity
az configure --defaults location=$AZURE_LOCATION
az configure --defaults group=$AZURE_RESOURCE_GROUP

### sample keyvault creation (requires --no-self-perms since we are running under a managed identity)
#az keyvault create --name kv-$AZURE_RESOURCE_GROUP --enabled-for-deployment true --enabled-for-template-deployment true --no-self-perms > output.json
#jq -r '"keyVaultUrl: \(.properties.vaultUri)"' output.json

## sample keyvault secret set/get operations
az keyvault secret set --name "mySecret" --value "mySecretValue" --vault-name $AZURE_KEYVAULT > secret.json
jq -r '"secretUrl: \(.attributes.id)"' secret.json

az keyvault secret show --vault-name $AZURE_KEYVAULT --name "mySecret" > secret.json
jq -r '"secretValue: \(.value)"' secret.json

## uncomment the below statement to troubleshoot your startup script interactively in ACI
#tail -f /dev/null