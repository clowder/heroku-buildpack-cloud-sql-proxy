#!/usr/bin/env bash

echo "$GCLOUD_CREDS" > "$HOME/.gcloud/creds.json"
export GOOGLE_APPLICATION_CREDENTIALS="$HOME/.gcloud/creds.json"

export PATH="$HOME/.gcloud/bin:$PATH"

if [[ -t 0 ]]; then
  (setsid cloud_sql_proxy --health-check --max-sigterm-delay "10s" "$GCLOUD_SQL_INSTANCE" > "$HOME/.gcloud/var/log/cloud_sql_proxy.log" 2>&1) &
else
  (setsid cloud_sql_proxy --health-check --max-sigterm-delay "10s" "$GCLOUD_SQL_INSTANCE") &
fi

if ! curl -sf --retry 5 --retry-all-errors --retry-delay 1 http://localhost:9090/startup > /dev/null; then
  echo "Google Cloud SQL Proxy failed to start."
  exit 1
fi
