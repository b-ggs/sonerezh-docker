#!/bin/bash
set -e

sed -i "s/SONEREZH_DB_ENV_TYPE/${SONEREZH_DB_ENV_TYPE}/" /usr/share/nginx/sonerezh/app/Config/database.php
sed -i "s/define('DOCKER', false)/define('DOCKER', true)/" /usr/share/nginx/sonerezh/app/Config/bootstrap.php

exec "$@"
