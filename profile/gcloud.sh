#!/usr/bin/env bash

echo "$GCLOUD_CREDS" > "$HOME/.gcloud/creds.json"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcloud/creds.json"

export PATH="$HOME/.gcloud/bin:$PATH"
