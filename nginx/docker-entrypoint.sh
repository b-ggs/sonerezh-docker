#!/bin/bash
set -e

sed -i "s/define('DOCKER', false)/define('DOCKER', true)/" /usr/share/nginx/sonerezh/app/Config/bootstrap.php

exec "$@"
