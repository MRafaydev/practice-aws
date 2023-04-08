#!/bin/bash
set -x
# Set the organization, project, and pipeline information
ORGANIZATION="SE20-105"
PROJECT="example-app"
PIPELINE_ID="45"

# Setting up the password
PASSWORD="rcn3vrbkrjyg5zyvrvcgyzsvyoakip5r7525iljhhzpkqrbvs3hq"

# Set the parameters for the pipeline
FOLDER_A=true
FOLDER_B=false
FOLDER_C=false

# Encode the parameters as JSON
PARAMETERS="{\"folder_a\": $FOLDER_A, \"folder_b\": $FOLDER_B, \"folder_c\": $FOLDER_C}"

# Get the content length of the JSON data
CONTENT_LENGTH=$(echo -n "$PARAMETERS" | wc -c)

# Trigger the pipeline with the specified parameters
curl -u :$PASSWORD \
  -H "Content-Type:application/json" \
  -d "$PARAMETERS" \
  "https://dev.azure.com/$ORGANIZATION/$PROJECT/_apis/pipelines/$PIPELINE_ID/runs?api-version=7.1-preview.1"
