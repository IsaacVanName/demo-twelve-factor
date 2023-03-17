#!/bin/bash

# Token is set in the .env used for compose
# Vault address is set in .env and made available to all containers
vault login $VAULT_TOKEN

# Parsing a file of lines like service:password
#   separated by newlines
if [[ -f ./credentials.txt]]; then
    while read line; do
        key = `echo $line | cut -d':' -f1`
        value = `echo $line | cut -d':' -f2`

        vault kv put $key $value
    done < ./credentials.txt

    echo "WARNING: Storing a credentials text file in the repo is very poor security."
    echo "         Please consider removing this file once you've created and persisted the Vault storage."
fi
