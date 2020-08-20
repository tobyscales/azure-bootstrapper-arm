#!/bin/bash
# additional environment variables available: $AZURE_SUBSCRIPTION_ID, $AZURE_AADTENANT_ID and $AZURE_KEYVAULT

echo Location: $AZURE_LOCATION
echo Resource Group: $AZURE_RESOURCE_GROUP

# cribbed from http://fahdshariff.blogspot.com/2014/02/retrying-commands-in-shell-scripts.html
# Retries a command on failure. 
# $1 - the max number of attempts
# $2... - the command to run

retry() {
    local -r -i max_attempts="$1"; shift
    local -r cmd="$@"
    local -i attempt_num=1
    until $cmd
    do
        if ((attempt_num==max_attempts))
        then
            echo "Attempt $attempt_num failed and there are no more attempts left!"
            return 1
        else
            echo "Attempt $attempt_num failed! Trying again in $attempt_num seconds..."
            sleep $((attempt_num++))
        fi
    done
}

#retry 5 az login --identity

az configure --defaults location=$AZURE_LOCATION
az configure --defaults group=$AZURE_RESOURCE_GROUP

echo Downloading $BOOTSTRAP_URI...
curl -o bootstrap.sh $BOOTSTRAP_URI

echo Executing $BOOTSTRAP_URI from ${cwd}...
source ./bootstrap.sh

## sample keyvault secret set/get operations
#az keyvault secret set --vault-name $AZURE_KEYVAULT --name "mySecret" --value "mySecretValue"  > secret.json
#jq -r '"secretUrl: \(.id)"' secret.json

#az keyvault secret show --vault-name $AZURE_KEYVAULT --name "mySecret" > value.json
#jq -r '"secretValue: \(.value)"' value.json

## uncomment the below statement to troubleshoot your startup script interactively in ACI (on the Connect tab)
#tail -f /dev/null