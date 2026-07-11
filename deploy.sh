#!/bin/bash

ENVIRONMENT=$1
DEPLOYMENT_MESSAGE=$2

# Copy the appropriate clasp config based on environment
if [ "$ENVIRONMENT" = "dev" ]; then
    cp .clasp.dev.json .clasp.json
elif [ "$ENVIRONMENT" = "prod" ]; then
    cp .clasp.prod.json .clasp.json
else
    echo "Error: Environment must be 'dev' or 'prod'"
    exit 1
fi

# Copy backend files to dist
cp ./dist/backend/* ./dist/

# Remove backend folder to avoid duplicate deployment
rm -rf ./dist/backend

# Copy appsscript.json manifest file
cp ./src/backend/appsscript.json ./dist

clasp push -f

deployments=$(clasp deployments)
deployment_string=$(echo "$deployments" | sed '3!d')
id_start=$(echo "$deployment_string" | awk '{print index($0, "-") + 1}')
deployment_id=$(echo "$deployment_string" | cut -d' ' -f "$id_start")
deployment_id="${deployment_id##-}"

if [ -z "$deployment_id" ]; then
    clasp deploy -d "$DEPLOYMENT_MESSAGE"
else
    clasp deploy -i "$deployment_id" -d "$DEPLOYMENT_MESSAGE"
fi