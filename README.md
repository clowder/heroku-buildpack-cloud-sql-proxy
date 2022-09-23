# Heroku buildpack for Google Cloud SQL Auth proxy

## Install

Assumes you have a database and service account with [appropriate
permissions][1] created.

1. Add this buildpack to the build stack.
    ```shell
    $ heroku buildpacks:add --index https://github.com/clowder/heroku-buildpack-cloud-sql-proxy.git
    ```
2. Set an environment variable containing you're service accounts JSON access
   key.
    ```shell
    heroku config:set GCLOUD_CREDS="$(cat <PATH_TO_KEY_JSON>)"
    ```
3. Set an environment variable containing the connection name of the instance
   you're connecting to.
    ```shell
    heroku config:set GCLOUD_SQL_INSTANCE=<INSTANCE_CONNECTION_NAME>
    ```

[1]: https://github.com/GoogleCloudPlatform/cloud-sql-proxy#credentials
